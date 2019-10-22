import 'package:flutter/material.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/restaurant_bloc.dart';
import 'package:restaurant_finder/DataLayer/city.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';
import 'package:restaurant_finder/UI/restaurant_tile.dart';

class RestaurantScreen extends StatelessWidget {
  City city;

  RestaurantScreen({Key key, @required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city.title),
      ),
      body: _buildSearch(context),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = RestaurantBloc(city);
    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "What do you want to eat?",
              ),
              onChanged: (query) => bloc.submitQuery(query),
            ),
          ),
          Expanded(
            child: _buildStreamBuilder(bloc),
          )
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(RestaurantBloc bloc) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        final results = snapshot.data;
        if (results == null) {
          return Center(
            child: Text("Enter  retaurant name or cuisine"),
          );
        }

        if (results.isEmpty) {
          return Center(child: Text("No results"));
        }

        return _buildResults(results);
      },
    );
  }

  Widget _buildResults(List<Restaurant> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final Restaurant restaurant = results[index];
        return RestaurantTile(restaurant: restaurant,);
      },
    );
  }
}
