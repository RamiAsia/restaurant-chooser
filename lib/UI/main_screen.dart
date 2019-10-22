import 'package:flutter/material.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/city_bloc.dart';
import 'package:restaurant_finder/UI/city_screen.dart';
import 'package:restaurant_finder/UI/restaurant_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: BlocProvider.of<CityBloc>(context).cityStream,
      builder: (context, snapshot) {
        final city = snapshot.data;
        if (city == null){
          return LocationScreen();
        }

        return RestaurantScreen(city: city,);
      }
    );
  }
}