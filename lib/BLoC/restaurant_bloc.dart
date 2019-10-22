import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';
import 'package:restaurant_finder/DataLayer/city.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';
import 'package:restaurant_finder/DataLayer/zomato_client.dart';

class RestaurantBloc extends Bloc {
  City _city;
  ZomatoClient _client = ZomatoClient();
  StreamController _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantBloc(this._city);
  
  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(_city, query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
  
}