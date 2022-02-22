import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kamitrils/util_route_menu.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RouteMenu.home().menuItem("Home"),
          RouteMenu.profile().menuItem("Profile"),
          RouteMenu.kasir().menuItem("Kasir"),
        ],
      ),
    );
  }
}
