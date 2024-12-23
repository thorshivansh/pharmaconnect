import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaconnect/core/utils/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:pharmaconnect/presentation/home/controller/home_controller.dart';
import 'package:pharmaconnect/presentation/home/home_page.dart';
import 'package:pharmaconnect/presentation/myorder/myorder.dart';
import 'package:pharmaconnect/presentation/profile/myprofile.dart';
import 'package:pharmaconnect/routes/routes.dart';

import '../../core/app_export.dart';

class DashBoard extends GetView<HomeController> {
  const DashBoard({Key? key})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: SafeArea(
        child: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.home,
          onGenerateRoute: (routeSetting) => GetPageRoute(
            page: () => getCurrentPage(routeSetting.name!),
            transition: Transition.noTransition,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          print(type);

          Get.toNamed(getCurrentRoute(type), id: 1);
        },
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.home;
      case BottomBarEnum.Myorders:
        return AppRoutes.myOrderPage;
      case BottomBarEnum.Cart:
        return AppRoutes.myCart;
      case BottomBarEnum.Profile:
        return AppRoutes.myProfilePage;
      default:
        return AppRoutes.initialRoute;
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.home:
        return HomePage();
      case AppRoutes.myOrderPage:
        return MyOrderPage();
      case AppRoutes.myCart:
        return DefaultWidget();
      case AppRoutes.myProfilePage:
        return const MyProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
