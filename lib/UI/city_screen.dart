import 'package:flutter/material.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/city_bloc.dart';
import 'package:restaurant_finder/BLoC/city_query_bloc.dart';
import 'package:restaurant_finder/DataLayer/city.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;

  LocationScreen({Key key, this.isFullScreenDialog = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CityQueryBloc();

    return BlocProvider<CityQueryBloc>(
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
                  hintText: "Enter a city",
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

  Widget _buildResults(CityQueryBloc bloc) {
    return StreamBuilder(
      stream: bloc.cityStream,
      builder: (context, snapshot) {
        final results = snapshot.data;

        if (results == null) {
          return Container();
        }

        if (results.isEmpty) {
          return Center(
            child: Text("Sorry, no results"),
          );
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<City> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final city = results[index];
        return ListTile(
          title: Text(city.title),
          onTap: () {
            final cityBloc = BlocProvider.of<CityBloc>(context);
            cityBloc.selectCity(city);

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }
}
