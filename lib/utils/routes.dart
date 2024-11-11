import 'package:get/get.dart';

import '../view/Dashboard.dart';

class Routes {
  static const String home = '/';

  static List<GetPage<dynamic>> pages = [
    GetPage(name: home, page: () => const homePage()),
    GetPage(name: home, page: () => const homePage()),
  ];
}
