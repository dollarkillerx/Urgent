import 'package:get/get.dart';
import '../../common/storage/user_info.dart';

class DashBoardController extends GetxController {
  String storehouse = "";
  var title = "";
  var tabIndex = 0.obs;


  changeTabIndex(int index) async {
    switch (index) {
      case 0:
        var activeUser = await UserInfoData.getActiveAccount();
        if (activeUser != null) {
          this.storehouse = activeUser.storehouse!;
        }
        title =  title = "ようこそ ${storehouse}";
        break;
      case 1:
        title = "Statistics";
        break;
      case 2:
        title = "Tools";
        break;
    }

    tabIndex.value = index;
    update();
  }


  @override
  Future<void> onInit() async {
    var activeUser = await UserInfoData.getActiveAccount();
    if (activeUser != null) {
      this.storehouse = activeUser.storehouse!;
    }

    title = "ようこそ ${storehouse}";
    update();
    super.onInit();
  }
}