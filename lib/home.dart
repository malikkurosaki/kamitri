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
          title: Text("Kamitri"),
          actions: [
            IconButton(
              onPressed: (){
                Get.dialog(Dialog(
                  child: HomeListProduct(),
                ),);
              }, 
              icon: Icon(Icons.add_box)
            )
          ],
        ): null,
        drawer: layar.isMobile? Drawer(
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Kami Tri",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 24
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Get.dialog(Dialog(
                        child: HomeListProduct(),
                      ));
                    }, 
                    icon: Icon(Icons.add_box_rounded)
                  )
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
                      decoration: BoxDecoration(
                          border:
                              Border(right: BorderSide(color: Colors.black12))),
                      width: Get.width / 4,
                      child: SingleChildScrollView(
                        child: HomeMenu(),
                      ),
                    ),
                  ),
                  Expanded(
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
