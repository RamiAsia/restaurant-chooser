import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';

import '../DataLayer/city.dart';

class CityBloc extends Bloc {
  City _city;
  City get selectedCity => _city;

  final _cityController = StreamController<City>();

  Stream<City> get cityStream => _cityController.stream;

  void selectCity(City city) {
    _city = city;
    _cityController.sink.add(city);
  }

  @override
  void dispose() {
    _cityController.close();
  }
}