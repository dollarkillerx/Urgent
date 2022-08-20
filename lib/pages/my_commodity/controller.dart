import 'package:get/get.dart';
import 'package:urgent/common/entity/good.dart';
import 'package:urgent/pages/my_commodity/provider.dart';
import '../../common/library/base_provider.dart';

class MyCommodityController extends GetxController {
  final String barcode = Get.arguments["barcode"];

  bool isLoading = true;
  String name = "";
  Good? good;

  MyCommodityProvider provider = Get.find();

  @override
  Future<void> onInit() async {
    await flashPage();
    super.onInit();
  }

  flashPage() async {
    Response response = await provider.search(barcode);
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      isLoading = false;
      update();
      return;
    }

    var god = Good.fromJson(response.body);
    name = god.data?.name??"";
    good = god;

    isLoading = false;
    update();
  }
}
