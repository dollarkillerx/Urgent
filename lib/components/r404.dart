import 'package:flutter/material.dart';
import 'package:get/get.dart';

class R404 extends StatelessWidget {

  final String title;

  R404({Key? key,this.title = "資源未找到"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          title: Text(this.title),
        ),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回"))
      ],
    );
  }
}