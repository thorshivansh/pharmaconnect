import 'package:pharmaconnect/core/utils/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:pharmaconnect/presentation/home/bindings/home_binding.dart';
import 'package:pharmaconnect/presentation/home/Dashboard.dart';
import 'package:pharmaconnect/presentation/home/home_page.dart';
import 'package:pharmaconnect/presentation/myorder/bindings/myoerder_bindings.dart';
import 'package:pharmaconnect/presentation/myorder/myorder.dart';
import 'package:pharmaconnect/presentation/product_detail/bindings/product_details_binding.dart';
import 'package:pharmaconnect/presentation/product_detail/product_details_page.dart';
import 'package:pharmaconnect/presentation/profile/bindings/my_profile_bindings.dart';
import 'package:pharmaconnect/presentation/profile/myprofile.dart';

import '../core/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/dash';
  static const String home = '/home';
  // static const String appNavigationScreen = '/app_navigation_screen';
  static const String myOrderPage = '/my_order';
  static const String myProfilePage = '/my_profile';
  static const String myCart = '/my_cart';
  static const String detailsPage = '/product_details';

  static List<GetPage> pages = [
    GetPage(
      name: myCart,
      page: () => const DefaultWidget(),
      // bindings: [CdProjectTrackingMobileBinding()],
    ),
    GetPage(
      name: myOrderPage,
      page: () => MyOrderPage(),
      bindings: [MyOrderBindings()],
    ),
    GetPage(
      name: myProfilePage,
      page: () => const MyProfilePage(),
      bindings: [MyProfileBindings()],
    ),
    GetPage(
      name: detailsPage,
      page: () => const ProductDetailsPage(),
      bindings: [ProductDetailsBinding()],
    ),
    GetPage(
      name: home,
      page: () => HomePage(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => const DashBoard(),
      bindings: [HomeBinding()],
    ),
  ];
}
