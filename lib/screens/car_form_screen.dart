import 'package:case_of_altur_project/constants/constant.dart';
import 'package:case_of_altur_project/element/buttons/butonlar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/car.dart';
import '../providers/car_provider.dart';

class CarFormScreen extends StatefulWidget {
  final Car? car;

  const CarFormScreen({super.key, this.car});

  @override
  State<CarFormScreen> createState() => _CarFormScreenState();
}

class _CarFormScreenState extends State<CarFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _plateController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.car?.name ?? '');
    _plateController = TextEditingController(text: widget.car?.plate ?? '');
    _descController =
        TextEditingController(text: widget.car?.description ?? '');
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final plate = _plateController.text.trim();
      final desc = _descController.text.trim();

      final carProvider = Provider.of<CarProvider>(context, listen: false);

      if (widget.car == null) {
        carProvider.addCar(name, plate, desc);
      } else {
        carProvider.updateCar(widget.car!.id, name, plate, desc);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.car != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Araç Düzenle' : 'Araç Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Araç Adı'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Zorunlu alan' : null),
              heightSpace15,
              TextFormField(
                  controller: _plateController,
                  decoration: const InputDecoration(labelText: 'Plaka'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Zorunlu alan' : null),
              heightSpace15,
              TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(labelText: 'Açıklama')),
              heightSpace25,
              appButton(context,
                  text: isEditing ? 'Güncelle' : 'Ekle', onPressed: _saveForm),
            ],
          ),
        ),
      ),
    );
  }
}
