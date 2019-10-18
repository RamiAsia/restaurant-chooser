import 'package:flutter/material.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/location_query_bloc.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc();

    return BlocProvider<LocationQueryBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Where we eating?"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter a location",
                ),
                onChanged: (query) => bloc.submitQuery(query),
              ),
            ),
            Expanded(
              child: _buildResults(bloc),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    return Center(
      child: Text("Enter a location"),
    );
  }
}
