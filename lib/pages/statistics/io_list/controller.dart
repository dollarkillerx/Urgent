import 'package:get/get.dart';
import 'package:urgent/pages/statistics/io_list/provider.dart';
import '../../../common/entity/io_list.dart';
import '../../../common/library/base_provider.dart';

class IOListController extends GetxController {
  IOListProvider provider = Get.find();
  var isLoading = true;
  var limit  = 0;
  IOList? iOList;

  @override
  void onInit() async {
    await loadData(0, 0);
    super.onInit();
  }


  Future<void> onRefresh({loadMore = false}) async {
    if (!loadMore) {
      limit = 0;
    }else {
      limit += 20;
    }
    if (limit >= iOList!.data!.count!) {
      return;
    }
    // isLoading = true;
    // update();

    try{
      loadData(limit, 20, loadMore: loadMore);
    }finally {
      Future.delayed(Duration(milliseconds: 1000),(){
        // isLoading = false;
        update();
      });
    }
  }

  loadData(int offset, int limit,{loadMore = false} ) async {
    print("len: ${iOList?.data?.items?.length}   offset: $offset limit $limit");
    Response response = await provider.ioList(offset, limit);
    var err = NetTools.CheckError(response.body);
    if (err != null) {
      Get.snackbar("錯誤", err);
      isLoading = false;
      update();
      return;
    }


    if (!loadMore) {
      iOList = IOList.fromJson(response.body);
      isLoading = false;
      update();
      return;
    }

    print("object123 $loadMore" );
    var newIoList = IOList.fromJson(response.body);
    iOList?.data?.items?.addAll(newIoList.data!.items!);
  }
}
