import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_export.dart';

enum Style { bgGradientnameteal300nameteal600 }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.height,
      this.shape,
      this.styleType,
      this.leadingWidth,
      // this.leading,
      this.title,
      this.centerTitle,
      this.automaticallyImplyLeading});
  final double? height;
  final ShapeBorder? shape;
  final Style? styleType;
  final double? leadingWidth;
  final bool? automaticallyImplyLeading;
  // final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  // final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 60.h,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      backgroundColor: appTheme.teal600,
      // flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: InkWell(
        child: Icon(
          CupertinoIcons.arrow_left,
          size: 20.h,
          color: Colors.white,
        ),
      ),
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: CustomImageView(
            height: 34.h,
            width: 36.h,
            imagePath: ImageConstant.imgNotification,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 60.h,
      );
}

Widget buildHeaderNavigation({Widget? leading, String? text}) {
  return SizedBox(
    width: double.maxFinite,
    child: Container(
      width: double.maxFinite,
      decoration: AppDecoration.gradientTealCToTealC.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 12.h,
            ),
            decoration: AppDecoration.gradientTealToTeal.copyWith(
              borderRadius: BorderRadiusStyle.customBorderBL14,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: Get.back,
                        child: leading ??
                            Icon(
                              Icons.arrow_back,
                              size: 20.h,
                              color: Colors.white,
                            ),
                      ),
                      SizedBox(width: 8.h),
                      Expanded(
                        child: Text(
                          text ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelMediumBold,
                        ),
                      )
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgApplicationNav,
                  height: 36.h,
                  width: 36.h,
                  radius: BorderRadius.circular(
                    8.h,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 6.h)
        ],
      ),
    ),
  );
}
