import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/pages/home/controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return ListView(
            shrinkWrap: true,
            children: [
              TextField(
                  maxLines: 1,
                  controller: controller.search,
                  decoration: InputDecoration(
                    //输入框decoration属性
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 1.0),
                    //设置搜索图片
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Icon(Icons.search),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      //设置搜索图片左对齐
                      minWidth: 30,
                      minHeight: 25,
                    ),
                    border: OutlineInputBorder(),
                    hintText: " 请输入商品名",
                  )),
              ...controller.goodList,
            ],
          );
        },
      ),
    );
  }
}
