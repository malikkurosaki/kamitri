import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect.dart';
import 'package:kamitrils/util_config.dart';
import 'package:kamitrils/util_pref.dart';
import 'package:kamitrils/util_route_menu.dart';
import 'package:kamitrils/util_val.dart';
import 'package:get/get.dart';

class Conn extends GetConnect {
  static const url = Conf.isDev ? Conf.urlDev : Conf.urlPro;

  getProdak() async {
    try {
      final data = await get(url + "/product");

      Val.listProduct.assignAll(data.body);
    } catch (e) {
      EasyLoading.showToast(e.toString());
    }
  }

  Future login(String email, String password) async {
    try {
      final data =
          await post(url + "/login", {"email": email, "password": password});

      print(data.body);

      if (data.body['success']) {
        Pref.userId().set(data.body['dataUser']['id']);
        RouteMenu.home().goOff();
      } else {
        EasyLoading.showToast(data.body['message']);
      }
    } catch (e) {
      EasyLoading.showToast(e.toString());
    }
  }

  Future register(String username, String password, String name) async {
    try {
      final data = await post(url + "/register",
          {"username": username, "password": password, "name": name});
      if (data.body['success']) {
        EasyLoading.showToast(data.body['message']);
        Pref.userId().set(data.body['dataUser']['id']);
        RouteMenu.home().goOff();
      } else {
        EasyLoading.showToast(data.body['message']);
      }
    } catch (e) {
      EasyLoading.showToast(e.toString());
    }
  }
}
