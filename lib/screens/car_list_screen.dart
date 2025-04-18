import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/car_provider.dart';
import 'car_form_screen.dart';
import 'empty_car_list_screen.dart';
import 'login_screen.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Araç Listesi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CarFormScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authProvider.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: carProvider.cars.isEmpty
          ? EmptyCarListPage()
          : ListView.builder(
              itemCount: carProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carProvider.cars[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(car.name),
                    subtitle: Text('${car.plate} - ${car.description}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CarFormScreen(car: car)),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            carProvider.deleteCar(car.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
