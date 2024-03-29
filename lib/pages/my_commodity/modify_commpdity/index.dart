import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:urgent/widget/loading.dart';
import '../../../common/library/img.dart';
import 'controller.dart';


// https://www.freesion.com/article/9564219478/ 裁剪 一体化
class ModifyCommodityPage extends GetView<ModifyCommodityController> {

  // 相機
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;

      // 压缩
      var c = await Img.compressAndGetFile(File(image.path));
      if(c == null) return;

      // controller.image = c;
      controller.setImg(c);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  _goods() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          title: Text("條碼"),
          subtitle: Text(controller.goods.data!.barcode!),
        ),
        TextField(
          controller: controller.name,
          decoration: InputDecoration(
            label: Text("商品名稱"),
          ),
        ),
        TextField(
          controller: controller.spec,
          decoration: InputDecoration(
            label: Text("规格"),
          ),
        ),
        TextField(
          controller: controller.brand,
          decoration: InputDecoration(
            label: Text("品牌"),
          ),
        ),
        TextField(
          controller: controller.madeIn,
          decoration: InputDecoration(
            label: Text("產地"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.price,
          decoration: InputDecoration(
            label: Text("价格"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.cost,
          decoration: InputDecoration(
            label: Text("成本"),
          ),
        ),

        () {
          if (controller.goods.data!.img != "" && controller.image == null) {
            return cachedImage(controller.goods.data!.img!);
          }
          if (controller.image != null) {
            return Image.file(controller.image!);
          }
          return SizedBox();
        }(),

        ElevatedButton(onPressed: () {
          pickImage();
        }, child: Text("拍照")),
        ElevatedButton(onPressed: () {
          controller.modifyGoods();
        }, child: Text("修改商品")),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回")),
        // imgp(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModifyCommodityController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "修改商品",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Loading(
            isLoading: controller.isLoading,
            child: _goods(),
          ),
        ),
      );
    });
  }
}
