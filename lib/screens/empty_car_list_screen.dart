import 'package:case_of_altur_project/constants/constant.dart';
import 'package:flutter/material.dart';

class EmptyCarListPage extends StatelessWidget {
  const EmptyCarListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Kurumsal bir ikon
              Icon(
                Icons.directions_car_filled_outlined,
                size: 100,
                color: Colors.grey.shade400,
              ),
              heightSpace25,
              Text(
                "Araç Listeniz Boş",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              heightSpace15,
              Text(
                "Henüz herhangi bir araç eklemediniz.\nYeni bir araç eklemek için + butonuna tıklayın.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
