import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kamitrils/util_route_menu.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: "Jitoo",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: RouteMenu.listPage,
    );
  }
}