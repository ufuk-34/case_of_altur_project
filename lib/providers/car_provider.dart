import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/car.dart';
import '../services/notification_service.dart';

class CarProvider with ChangeNotifier {
  final List<Car> _cars = [];
  List<Car> get cars => _cars;

  void addCar(String name, String plate, String description) {
    final newCar = Car(
      id: const Uuid().v4(),
      name: name,
      plate: plate,
      description: description,
    );
    _cars.add(newCar);
    notifyListeners();
    NotificationService.showNotification(title: 'Araç Eklendi', body: '$name başarıyla eklendi.');
  }

  void updateCar(String id, String name, String plate, String description) {
    final index = _cars.indexWhere((car) => car.id == id);
    if (index != -1) {
      _cars[index].name = name;
      _cars[index].plate = plate;
      _cars[index].description = description;
      notifyListeners();
      NotificationService.showNotification(title: 'Araç Güncellendi', body: '$name başarıyla güncellendi.');
    }
  }

  void deleteCar(String id) {
    final car = _cars.firstWhere((c) => c.id == id);
    _cars.removeWhere((car) => car.id == id);
    notifyListeners();
    NotificationService.showNotification(title: 'Araç Silindi', body: '${car.name} başarıyla silindi.');
  }
}