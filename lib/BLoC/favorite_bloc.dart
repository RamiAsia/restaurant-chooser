import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';

class FavoriteBloc extends Bloc {
  var _favoriteRestaurants = <Restaurant>[];
  List<Restaurant> get favorites => _favoriteRestaurants;

  final _controller = StreamController<List<Restaurant>>.broadcast();
  Stream<List<Restaurant>> get favoritesStream => _controller.stream;

  void toggleRestaurant(Restaurant restaurant) {
    if (_favoriteRestaurants.contains(restaurant)) {
      _favoriteRestaurants.remove(restaurant);
    } else {
      _favoriteRestaurants.add(restaurant);
    }

    _controller.sink.add(_favoriteRestaurants);
  }

  @override
  void dispose() {
    _controller.close();
  }

}