import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect.dart';
import 'package:kamitrils/util_config.dart';
import 'package:kamitrils/util_val.dart';
import 'package:get/get.dart';

class Conn extends GetConnect{
  static const url = Conf.isDev? Conf.urlDev: Conf.urlPro;
  
   getProdak() async{
     try {
       final data = await get(url+"/getProdak");
       Val.listProduct.assignAll(data.body);
     } catch (e) {
       EasyLoading.showToast(e.toString());
     }

   }
}