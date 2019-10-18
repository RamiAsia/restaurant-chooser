import 'package:flutter/material.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/location_bloc.dart';
import 'package:restaurant_finder/UI/location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: BlocProvider.of<CityBloc>(context).cityStream,
      builder: (context, snapshot) {
        final location = snapshot.data;
        if (location == null){
          return LocationScreen();
        }

        return Container();
      }
    );
  }
}