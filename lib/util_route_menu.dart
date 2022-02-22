import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamitrils/home.dart';
import 'package:kamitrils/login.dart';
import 'package:kamitrils/register.dart';
import 'package:kamitrils/root.dart';

class RouteMenu{
  RouteMenu();
  static final val = "home".obs;
  String key = "profile";

  RouteMenu.main() : key = "/";
  RouteMenu.home() : key = "/home";
  RouteMenu.profile(): key = "/profile";
  RouteMenu.kasir(): key = "/kasir";
  RouteMenu.login(): key = "/login";
  RouteMenu.register(): key = "/register";

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
    GetPage(name: RouteMenu.main().get(), page: () => Root(),),
    GetPage(name: RouteMenu.home().get(), page: () => Home(),),
    GetPage(name: RouteMenu.profile().get(), page: () => Home(),),
    GetPage(name: RouteMenu.kasir().get(), page: () => Home(),),
    GetPage(name: RouteMenu.login().get(), page: () => Login(),),
    GetPage(name: RouteMenu.register().get(), page: () => Register(),),
  ];

}