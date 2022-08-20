import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:urgent/common/library/img.dart';
import 'package:urgent/pages/home/provider.dart';
import '../../common/entity/home_list.dart';
import '../../common/library/base_provider.dart';

class HomeController extends GetxController {
  var goodList = <Widget>[];

  var search = TextEditingController();
  RxString searchText = ''.obs;
  var isLoading = true;

  HomeProvider provider = Get.find();

  @override
  void onInit() async {
    search.addListener(() {
      searchText.value = search.text;
    });

    debounce(
      searchText,
      (value) async {
        isLoading = true;
        goodList.clear();

        Response response = await provider.search(value.toString());
        print(response.status.code);
        var err = NetTools.CheckError(response.body);

        if (err == null) {
          HomeList list = HomeList.fromJson(response.body);
          if (list.data != null) {
            for (var i = 0; i < list.data!.length; i++) {
              if (list.data![i] != null) {
                goodList.add(Padding(
                    padding: EdgeInsets.all(3),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text("条码:"),
                                      subtitle: Text("${list.data![i].barcode}"),
                                    ),
                                    ListTile(
                                      title: Text("Name:"),
                                      subtitle: Text("${list.data![i].name}"),
                                    ),
                                    ListTile(
                                      title: Text("价格:"),
                                      subtitle: Text("${list.data![i].price}"),
                                    ),
                                    ListTile(
                                      title: Text("成本:"),
                                      subtitle: Text("${list.data![i].cost}"),
                                    ),
                                    ListTile(
                                      title: Text("库存:"),
                                      subtitle: Text("${list.data![i].quantity}"),
                                    ),
                                    ListTile(
                                      title: Text("总成本:"),
                                      subtitle: Text("${list.data![i].totalCost}"),
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: () {
                                  if (list.data![i].img != "") {
                                    return AspectRatio(
                                      aspectRatio: 1.0 / 2.0,
                                      child: cachedImage(list.data![i].img!),
                                    );
                                  }
                                  return SizedBox();
                                }())
                          ],
                        ),
                      ),
                      onTap: () async {
                        await Get.toNamed("/home/my_commodity",
                            arguments: {"barcode": list.data![i].barcode});
                        search.text = search.text + " ";
                      },
                    )));
              }
            }
          } else {
            print("list data is null");
          }
          print("up");
          update();
        }
        isLoading = false;
      },
      time: Duration(milliseconds: 150),
    );

    goodList.clear();

    Response response = await provider.search("");
    print(response.status.code);
    var err = NetTools.CheckError(response.body);

    if (err == null) {
      HomeList list = HomeList.fromJson(response.body);
      if (list.data != null) {
        for (var i = 0; i < list.data!.length; i++) {
          if (list.data![i] != null) {
            goodList.add(Padding(
                padding: EdgeInsets.all(3),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text("条码:"),
                                  subtitle: Text("${list.data![i].barcode}"),
                                ),
                                ListTile(
                                  title: Text("Name:"),
                                  subtitle: Text("${list.data![i].name}"),
                                ),
                                ListTile(
                                  title: Text("价格:"),
                                  subtitle: Text("${list.data![i].price}"),
                                ),
                                ListTile(
                                  title: Text("成本:"),
                                  subtitle: Text("${list.data![i].cost}"),
                                ),
                                ListTile(
                                  title: Text("库存:"),
                                  subtitle: Text("${list.data![i].quantity}"),
                                ),
                                ListTile(
                                  title: Text("总成本:"),
                                  subtitle: Text("${list.data![i].totalCost}"),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: () {
                              if (list.data![i].img != "") {
                                return AspectRatio(
                                  aspectRatio: 1.0 / 2.0,
                                  child: cachedImage(list.data![i].img!),
                                );
                              }
                              return SizedBox();
                            }())
                      ],
                    ),
                  ),
                  onTap: () async {
                    await Get.toNamed("/home/my_commodity",
                        arguments: {"barcode": list.data![i].barcode});
                    search.text = search.text + " ";
                  },
                )));
          }
        }
      } else {
        print("list data is null");
      }
    }

    print(goodList.length);
    isLoading = false;
    update();
    super.onInit();
  }
}
