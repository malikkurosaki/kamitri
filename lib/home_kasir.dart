import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamitrils/util_val.dart';
import 'home_list_product.dart';

class HomeKasir extends StatelessWidget {
  const HomeKasir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Get.dialog(
                    const Dialog(
                      child: HomeListProduct(),
                    ),
                  );
                },
                icon: const Icon(Icons.add_box)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black38,
            child: Row(
              children: const [
                Expanded(
                  child: Text("No"),
                ),
                Expanded(
                  flex: 4,
                  child: Text("name Product"),
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
                    child: Text((Val.listOrder.indexWhere(
                                (element) => element['id'] == lo['id']) +
                            1)
                        .toString()),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(lo['name']),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        if (value == "0") {
                          Get.dialog(AlertDialog(
                            content: const Text("Mau dihapus?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Val.listOrder[Val.listOrder.indexWhere(
                                            (element) =>
                                                element['id'] == lo['id'])]
                                        ['qty'] = 1;
                                    Val.listOrder.refresh();
                                    Get.back();
                                  },
                                  child: const Text("GAK !")),
                              TextButton(
                                  onPressed: () {
                                    Val.listOrder.removeWhere(
                                        (element) => element['id'] == lo['id']);
                                  },
                                  child: const Text("IYA !"))
                            ],
                          ));
                        }
                        lo['qty'] = value;
                      },
                      controller:
                          TextEditingController(text: lo['qty'].toString()),
                      decoration: const InputDecoration(
                          isDense: true, border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller:
                            TextEditingController(text: lo['desc'].toString()),
                        decoration: const InputDecoration(
                            hintText: "description",
                            isDense: true,
                            border: OutlineInputBorder()),
                      ),
                    ))
              ],
            )
        ],
      ),
    );
  }
}
