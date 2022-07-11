import 'package:flutter/material.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';
import 'components/favourite_card.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Row(
            children: [
              Text(
                "Favourites",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              //Text(
              //  "${demoCarts.length} items",
              //  style: Theme.of(context).textTheme.caption,
              ///),
            ],
          ),
        ],
      ),
    );
  }
}
