import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/widget/loading.dart';
import '../../../common/entity/io_list.dart';
import 'controller.dart';

class IOListPage extends GetView<IOListController> {
  _showData(context) {
    if (controller.iOList != null) {
      print(controller.iOList!.data!.items!.length);
      return RefreshIndicator(
          child: ListView.builder(
              itemCount: controller.iOList!.data!.items!.length,
              itemBuilder: (context, index) {
                if (index + 4 == controller.iOList!.data!.items!.length) {
                  Future.delayed(Duration(milliseconds: 200)).then((e) { // 這裏使用 delayed 是因爲不能在為builder完成時 使用setState()
                    controller.onRefresh(loadMore: true);
                  });
                }
                return buildItem(
                    context, controller.iOList!.data!.items![index], index);
              }
          ),
          onRefresh: controller.onRefresh);
    }

    return Center(
      child: Text("暫無數據"),
    );
  }

  // Future<void> _onRefresh({loadMore = false}) async {
  //   if (!loadMore) {
  //     controller.limit = 0;
  //   }else {
  //     controller.limit += 20;
  //   }
  //   controller.isLoading = true;
  //
  //   try{
  //     loadData(limit, 20);
  //   }finally {
  //     Future.delayed(Duration(milliseconds: 1000),(){
  //       isLoading = false;
  //       update();
  //     });
  //   }
  // }

  Widget buildItem(BuildContext context, IOListItem cdata, int index) {
    var col = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );

    col.children.add(Text("商品名稱: ${cdata.goodsName}"));
    col.children.add(Text("商品條碼: ${cdata.barcode}"));
    col.children.add(Text("總價: ${cdata.totalPrice}"));
    col.children.add(Text("縂成本: ${cdata.totalCost}"));
    col.children.add(Text("商品數量: ${cdata.numberProducts}"));
    col.children.add(Text("毛利: ${cdata.grossProfit}"));

    return ListTile(
      tileColor:
          index % 2 == 0 ? Colors.lightBlueAccent[100] : Colors.grey[100],
      title: Text(
          '類型: ${cdata.inventoryType == 'depot' ? '出庫' : '入庫'}     時間: ${cdata.createdAt!.substring(0, 19)}'),
      subtitle: col,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("最近出入庫記錄"),
      ),
      body: GetBuilder<IOListController>(
        builder: (controller) {
          return Loading(
              child: _showData(context), isLoading: controller.isLoading);
        },
      ),
    );
  }
}
