
import 'package:case_of_altur_project/helper/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final marginRight = 15.h;

class ToolTipController {
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;
  AnimationController? animationController;
  String message;

  ToolTipController({required this.message});

  Future hide() async {
    overlayEntry?.remove();
    await animationController?.reverse();
    overlayEntry = null;
    animationController = null;
    overlayState = null;
  }

  void show() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      overlayState?.insert(overlayEntry!);
      animationController?.forward();
    });
  }
}

class ErrorTooltip extends StatefulWidget {
  final ToolTipController controller;

  const ErrorTooltip({required this.controller});

  @override
  _ErrorTooltipState createState() => _ErrorTooltipState();
}

class _ErrorTooltipState extends State<ErrorTooltip> with TickerProviderStateMixin {
  final color = Colors.red;

  // late Size _size;

  late ToolTipController controller;

  @override
  void initState() {
    controller = widget.controller;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.hide();
      controller.animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
      controller.overlayState = Overlay.of(context);
      controller.overlayEntry = _makeOverlay();
      if (controller.message.isBBlank) {
        controller.hide();
      } else {
        controller.show();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget aa = const Icon(Icons.error,color: Colors.red,);
    return aa;
  }

  @override
  void dispose() {
    controller.animationController?.dispose();
    super.dispose();
  }

  Offset getOffset() {
    // var xx = context.findRenderObject();
    final renderBox = context.findRenderObject() as RenderBox;
    // _size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    return offset;
  }

  OverlayEntry _makeOverlay() {
    Offset offset = getOffset();
    return OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + 35.w,
        left: offset.dx - 40.w,
        // width: _size.width + 140,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.1, end: 0.9).animate(CurvedAnimation(parent: controller.animationController!, curve: Curves.bounceOut)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipPath(
                clipBehavior: Clip.antiAlias,
                clipper: ArrowClip(),
                child: Container(
                  height: 13.w,
                  width: 15.w,
                  margin: EdgeInsets.only(right: marginRight),
                  decoration: BoxDecoration(color: color),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.all(7.h),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Text(
                    controller.message,
                    style: const TextStyle(color: Colors.white),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArrowClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var width = size.width - marginRight;
    path.moveTo(0, size.height);
    path.lineTo(width / 2, 0);
    path.lineTo(width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
