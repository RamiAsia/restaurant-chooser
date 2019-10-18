import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';

import '../DataLayer/location.dart';

class LocationBloc extends Bloc {
  Location _location;
  Location get selectedLocation => _location;

  final _locationController = StreamController<Location>();

  Stream<Location> get locationSteeam => _locationController.stream;

  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  @override
  void dispose() {
    _locationController.close();
  }
}