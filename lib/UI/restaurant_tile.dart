import 'package:flutter/material.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';

import 'image_container.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantTile({Key key, @required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageContainer(
        width: 50,
        height: 50,
        url: restaurant.imageUrl,
      ),
      title: Text(restaurant.name),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
