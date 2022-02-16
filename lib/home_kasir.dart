import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:kamitrils/util_val.dart';
import 'package:get/get.dart';

class HomeKasir extends StatelessWidget {
  const HomeKasir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.black38,
            child: Row(
              children: [
                Expanded(
                  child: Text("No"),
                ),
                Expanded(
                  flex: 4,
                  child: Text("Nama Product"),
                ),
                Expanded(
                  child: Text("qty"),
                ),
                Expanded(
                  flex: 3,
                  child: Text("Note"),
                )
              ],
            ),
          ),
          for (final lo in Val.listOrder)
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text((Val.listOrder
                        .indexWhere((element) => element['id'] == lo['id']) + 1
                        ).toString()),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(lo['nama']),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        if(value == "0"){
                          Get.dialog(
                            AlertDialog(
                              content: Text("Mau dihapus?"),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Val.listOrder[Val.listOrder.indexWhere((element) => element['id'] == lo['id'])]['qty'] = 1;
                                    Val.listOrder.refresh();
                                    Get.back();
                                  }, 
                                  child: Text("GAK !")
                                ),
                                TextButton(
                                  onPressed: (){
                                    Val.listOrder.removeWhere((element) => element['id'] == lo['id']);
                                  }, 
                                  child: Text("IYA !")
                                )
                              ],
                            )
                          );
                        }
                        lo['qty'] = value;
                      },
                      controller: TextEditingController(text: lo['qty'].toString()),
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: TextEditingController(text: lo['ket'].toString()),
                      decoration: InputDecoration(
                        hintText: "keterangan",
                        isDense: true,
                        border: OutlineInputBorder()
                      ),
                    ),
                  )
                )
              ],
            )
        ],
      ),
    );
  }
}
