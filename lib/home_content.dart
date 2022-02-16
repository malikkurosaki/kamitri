import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kamitrils/home_kasir.dart';
import 'package:kamitrils/util_route_menu.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteMenu.home().content(
              Text("Ini Home"),
            ),
            RouteMenu.profile().content(
              Text("ini profile"),
            ),
            RouteMenu.kasir().content(
              HomeKasir(),
            )
          ],
        ),
      ),
    );
  }
}
