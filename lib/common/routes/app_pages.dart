import 'package:get/get.dart';
import 'package:urgent/pages/account/binding.dart';
import 'package:urgent/pages/account/index.dart';
import 'package:urgent/pages/bashboard/binding.dart';
import 'package:urgent/pages/bashboard/index.dart';
import 'package:urgent/pages/home/binding.dart';
import 'package:urgent/pages/home/index.dart';
import 'package:urgent/pages/my_commodity/binding.dart';
import 'package:urgent/pages/my_commodity/index.dart';
import 'package:urgent/pages/my_commodity/io_history/binding.dart';
import 'package:urgent/pages/my_commodity/io_history/index.dart';
import 'package:urgent/pages/my_commodity/out_stock/binding.dart';
import 'package:urgent/pages/my_commodity/out_stock/index.dart';
import 'package:urgent/pages/my_commodity/warehousing/binding.dart';
import 'package:urgent/pages/my_commodity/warehousing/index.dart';
import 'package:urgent/pages/notfound/index.dart';
import 'package:urgent/pages/online_commodity/binding.dart';
import 'package:urgent/pages/online_commodity/index.dart';
import 'package:urgent/pages/statistics/binding.dart';
import '../../pages/my_commodity/add_commondity/binding.dart';
import '../../pages/my_commodity/add_commondity/index.dart';
import '../../pages/statistics/index.dart';
import 'app_routes.dart';

class AppPages {
  static const INIT = AppRoutes.DASHBOARD;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      children: <GetPage>[
        GetPage(
          name: AppRoutes.OnlineCommodity,
          page: () => OnlineCommodityPage(),
          binding: OnlineCommodityBinding(),
        ),
        GetPage(
          name: AppRoutes.MyCommodity,
          page: () => MyCommodityPage(),
          binding: MyCommodityBinding(),
        ),
        GetPage(
          name: AppRoutes.AddCommodity,
          page: () => AddCommodityPage(),
          binding: AddCommodityBinding(),
        ),
        GetPage(
          name: AppRoutes.WareHousing,
          page: () => WarehousingPage(),
          binding: WarehousingBinding(),
        ),
        GetPage(
          name: AppRoutes.OutStock,
          page: () => OutStockPage(),
          binding: OutStockBinding(),
        ),
        GetPage(
          name: AppRoutes.IOHistory,
          page: () => IOHistoryPage(),
          binding: IOHistoryBinding(),
        ),
        GetPage(
          name: AppRoutes.Statistics,
          page: () => StatisticsPage(),
          binding: StatisticsBinding(),
        )
      ],
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashBoardPage(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: AppRoutes.ACCOUNT,
      page: () => AccountPage(),
      binding: AccountBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NOTFOUND,
    page: () => NotFoundView(),
  );
}
