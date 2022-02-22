import 'package:flutter/material.dart';
import 'package:kamitrils/home_content.dart';
import 'package:kamitrils/home_list_product.dart';
import 'package:kamitrils/home_menu.dart';
import 'package:kamitrils/util_route_menu.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onLoad();
    return ResponsiveBuilder(
      builder: (context, layar) => Scaffold(
        appBar: layar.isMobile? AppBar(
          title: const Text("Kamitri"),
        ): null,
        drawer: layar.isMobile? const Drawer(
          child: HomeMenu(),
        ): null,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: !layar.isMobile,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Kami Tri",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 24
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !layar.isMobile,
                    child: Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          border:
                              Border(right: BorderSide(color: Colors.black12))),
                      width: Get.width / 4,
                      child: const SingleChildScrollView(
                        child: HomeMenu(),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: HomeContent(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onLoad(){
    RouteMenu.kasir().set();
  }
}
