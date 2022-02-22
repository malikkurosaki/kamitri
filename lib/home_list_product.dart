import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:kamitrils/util_conn.dart';
import 'package:kamitrils/util_val.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeListProduct extends StatelessWidget {
  const HomeListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onLoad();
    return ResponsiveBuilder(
      builder: (context, layar) => 
      Column(
      children: [
        Row(
          children: [
            const BackButton(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: Get.width /2,
                    child: TextFormField(
                      onChanged: (value) => Val.listProductSearch.value = value,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        hintText: "search"
                      ),
                    ),
                  ),
                ),
              )
            )
          ],
        ),
        Flexible(
          child: Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !layar.isMobile,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.black12))
                    ),
                    height: double.infinity,
                    width: Get.width / 6,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Kategori")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        for(final p in Val.listProduct)
                        Visibility(
                          visible: p['name'].toString().contains(Val.listProductSearch.value),
                          child: InkWell(
                            onTap: () {
                              if(Val.listOrder.map((element) => element['id']).toList().contains(p['id'])){
                                Val.listOrder.removeWhere((element) => element['id'] == p['id']);
                              }else{
                                p['qty'] = 1;
                                Val.listOrder.add(p);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Val.listOrder.map((element) => element['id']).toList().contains(p['id'])? Colors.blue: Colors.grey[100],
                                width: layar.isMobile? 100: 200,
                                height: layar.isMobile? 100: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Image.asset('images/splash.png',
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(p['name'].toString(), overflow: TextOverflow.ellipsis,),
                                          Text(p['price'].toString()),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
    )
    ;
  }

  onLoad() async {
    Conn().getProdak();
  }
}
