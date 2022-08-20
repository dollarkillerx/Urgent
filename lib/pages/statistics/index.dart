import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgent/common/entity/statistics.dart';
import 'package:urgent/widget/loading.dart';
import 'controller.dart';

class StatisticsPage extends GetView<StatisticsController> {
  _showData() {
    if (controller.statistics != null) {
      print(controller.statistics!.data!.length);
      return ListView.builder(
          itemCount: controller.statistics!.data!.length,
          itemBuilder: (context, index) => buildItem(context, controller.statistics!.data![index], index));
    }

    return Center(
      child: Text("暫無數據"),
    );
  }

  Widget buildItem(BuildContext context, StatisticsItem data, int index) {
    var col = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    );

    data.value?.forEach((e) => {
      col.children.add(Text(e))
    });

    return ListTile(
      tileColor: index % 2 == 0? Colors.lightBlueAccent[100]: Colors.grey[100],
      title: Text(data.key!),
      subtitle: col,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<StatisticsController>(
        builder: (controller) {
          return Loading(child: _showData(), isLoading: controller.isLoading);
        },
      ),
    );
  }
}
