import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';
import 'package:restaurant_finder/DataLayer/zomato_client.dart';

import '../DataLayer/city.dart';

class CityQueryBloc implements Bloc {
  final _controller = StreamController<List<City>>();
  final _client = ZomatoClient();
  Stream<List<City>> get cityStream => _controller.stream;

  void submitQuery(String query) async {
    final results = await _client.fetchCities(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}