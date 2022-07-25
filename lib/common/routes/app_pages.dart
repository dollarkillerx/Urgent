import 'package:get/get.dart';
import 'package:urgent/pages/account/binding.dart';
import 'package:urgent/pages/account/index.dart';
import 'package:urgent/pages/bashboard/binding.dart';
import 'package:urgent/pages/bashboard/index.dart';
import 'package:urgent/pages/home/binding.dart';
import 'package:urgent/pages/home/index.dart';
import 'package:urgent/pages/notfound/index.dart';
import 'app_routes.dart';

class AppPages {
  static const INIT = AppRoutes.DASHBOARD;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
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
