import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/io_history.dart';
import 'package:urgent/widget/loading.dart';
import 'controller.dart';

class IOHistoryPage extends GetView<IOHistoryController> {

  _goods() {
    if (controller.ioHistory != null) {
        print(controller.ioHistory!.data!.length);
        return ListView.builder(
            itemCount: controller.ioHistory!.data!.length,
            itemBuilder: (context, index) => buildItem(context, index));
    }

    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: Text("返回")),
      ],
    );
  }

  Widget buildItem(BuildContext context, int index) {
    //滑动组件
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The end action pane is the one at the right or the bottom side.
      endActionPane:  ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              controller.deleteOrder(controller.ioHistory!.data![index].id!);
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: '刪除',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: interData(controller.ioHistory!.data![index]),
    );
  }

  Widget interData(IOHistoryItem cdata) {
    return ListTile(
        title: Text('類型: ${cdata.inventoryType == 'depot'?'出庫':'入庫'}     時間: ${cdata.createdAt!.substring(0,19)}'),
        subtitle: cdata.inventoryType == 'depot'?
        Text("出庫數量: ${cdata.numberProducts}  單價: ${cdata.grossProfit} 總價: ${cdata.totalPrice}  成本: ${cdata.totalCost} 盈利: ${cdata.totalPrice - cdata.totalCost}"):
        Text("入庫數量: ${cdata.numberProducts}  成本: ${cdata.totalCost}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IOHistoryController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "進出庫歷史: ${controller.goods.data!.name}",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Loading(child: _goods(),isLoading: controller.isLoading,),
      );
    });
  }
}
