// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pharmaconnect/presentation/home/controller/home_controller.dart';

import '../../../app_export.dart';

enum BottomBarEnum { Home, Myorders, Cart, Profile }

// ignore_for_file: must_be_immutableclass
class CustomBottomBar extends GetView<HomeController> {
  CustomBottomBar({super.key, this.onChanged});

  final List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMyOrders,
      activeIcon: ImageConstant.imgNavMyOrders,
      title: "lbl_my_orders".tr,
      type: BottomBarEnum.Myorders,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavCart,
      activeIcon: ImageConstant.imgNavCart,
      title: "lbl_cart".tr,
      type: BottomBarEnum.Cart,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    ),
  ];

  final Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: appTheme.gray50,
        ),
        child: BottomNavigationBar(
          iconSize: 24.h,
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          enableFeedback: false, // Disables vibration or sound feedback
          selectedFontSize: 12, // Keeps label size fixed
          unselectedFontSize: 12,
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 24.h,
                    width: 24.h,
                    color: appTheme.blueGray300,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labeNavBold.copyWith(
                      color: appTheme.blueGray300,
                    ),
                  )
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 24.h,
                    width: 24.h,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labeNavBold.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  )
                ],
              ),
              label: '', // Optional if labels are provided outside icons
            );
          }),
          onTap: (index) {
            controller.selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type});
  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Page is Empty',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
