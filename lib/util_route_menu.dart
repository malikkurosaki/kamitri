import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamitrils/home.dart';

class RouteMenu{
  RouteMenu();
  static final val = "home".obs;
  String key = "profile";

  RouteMenu.main() : key = "/";
  RouteMenu.home() : key = "/home";
  RouteMenu.profile(): key = "/profile";
  RouteMenu.kasir(): key = "/kasir";

  get() => key;
  set() => val.value = key;

  menuItem(String title) => ListTile(
    title:  Text(title),
    onTap: () => set(),
    selected: val.value == key,
  );

  content(Widget child) => 
  Visibility(
    visible: val.value == key,
    child: child
  );

  static final listPage = <GetPage>[
    GetPage(name: RouteMenu.main().get(), page: () => Home(),)
  ];

}