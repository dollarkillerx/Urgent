import 'package:get/get.dart';
import 'package:urgent/common/entity/statistics.dart';
import 'package:urgent/pages/statistics/provider.dart';
import '../../common/library/base_provider.dart';

class StatisticsController extends GetxController {

  StatisticsProvider provider = Get.find();
  var isLoading = true;
  Statistics? statistics;

  @override
  void onInit() async {
    await loadData();
    super.onInit();
  }

  loadData() async {
    Response response = await provider.statistics();
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      Get.snackbar("錯誤", err);
      isLoading = false;
      update();
      return;
    }

    statistics = Statistics.fromJson(response.body);
    isLoading = false;
    update();
  }
}
