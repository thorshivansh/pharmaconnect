import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/utils/widgets/appbar/custom_appbar.dart';
import 'package:pharmaconnect/core/utils/widgets/custom_elevated_button.dart';
import 'package:pharmaconnect/core/utils/widgets/custom_icon_button.dart';
import 'package:pharmaconnect/presentation/product_detail/controller/product_details_controller.dart';
import 'package:pharmaconnect/presentation/product_detail/widgets/recommended.dart';

import '../../core/app_export.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'model/recommended_model.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  final RecommendedModel? model;
  const ProductDetailsPage({this.model, super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.gray10001,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  buildHeaderNavigation(text: model!.productName ?? "_"),
                  _buildProductSlider(model),
                  SizedBox(height: 12.h),
                  _buildProductDetails(),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "msg_especially_for_you".tr,
                        style: CustomTextStyles.titleMediumBlack900,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "msg_list_of_drugs_assigned".tr,
                        style: CustomTextStyles.bodySmallGray500,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  _buildRecommendedProducts(),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: _buildOrderSummary(context)),
    );
  }

//
  Widget _buildProductSlider(RecommendedModel? model) {
    List imageList = [model!.imagePath, model.imagePath];
    return SizedBox(
      height: 405.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillOnErrorContainer,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 38.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 32.h),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 224.h,
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        // controller.sliderIndex.value = index;
                      },
                    ),
                    itemCount: imageList.length,
                    itemBuilder: (context, index, realIndex) {
                      return CustomImageView(
                        imagePath: imageList[index],
                        height: 224.h,
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 6.h,
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.sliderIndex.value,
                    count: controller.recommendedList.length,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 3,
                      dotColor: appTheme.blueGray100,
                      dotHeight: 6.h,
                      dotWidth: 6.h,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 230.h,
                    margin: EdgeInsets.only(left: 16.h),
                    child: Text(
                      model.productName ?? "msg_dr_odin_bpcboa".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallGray80001,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Row(
                    children: [
                      Text(
                        "lbl_free_sample".tr,
                        style: CustomTextStyles.bodySmallOnPrimary,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(left: 4.h),
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Text(
                            "lbl_trial".tr,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodySmallPrimary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  decoration: AppDecoration.outlineBlue,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "msg_maximum_of_12_unit".tr,
                        style: CustomTextStyles.labelMediumOnError,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductDetails() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
      decoration: AppDecoration.fillOnErrorContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_product_information".tr,
            style: CustomTextStyles.titleSmallBlack900,
          ),
          SizedBox(height: 10.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "msg_dr_odin_bpcboa2".tr,
                  style: CustomTextStyles.bodySmallSecondaryContainer,
                ),
                TextSpan(
                  text: "lbl_uses".tr,
                  style: CustomTextStyles.labelMediumPrimaryContainer,
                ),
                TextSpan(
                  text: "msg_it_is_used_for_measuring".tr,
                  style: CustomTextStyles.bodySmallSecondaryContainer,
                ),
                TextSpan(
                  text: "msg_product_features".tr,
                  style: theme.textTheme.labelMedium,
                ),
                TextSpan(
                  text: "msg_it_has_a_portable".tr,
                  style: CustomTextStyles.bodySmallSecondaryContainer,
                ),
                TextSpan(
                  text: "msg_directions_for_use".tr,
                  style: CustomTextStyles.labelMediumSemiBold,
                ),
                TextSpan(
                  text: "msg_use_as_directed".tr,
                  style: CustomTextStyles.bodySmallSecondaryContainer,
                ),
                TextSpan(
                  text: "msg_safety_information_store1".tr,
                  style: CustomTextStyles.labelMediumSemiBold,
                ),
                TextSpan(
                  text: "msg_safety_information_store".tr,
                  style: CustomTextStyles.bodySmallSecondaryContainer,
                )
              ],
            ),
            textAlign: TextAlign.left,
            maxLines: 28,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "lbl_view_less".tr,
                  style: CustomTextStyles.labelMediumBlue500.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                  width: 14.h,
                  child: Icon(
                    size: 14.h,
                    Icons.keyboard_arrow_up_sharp,
                    color: appTheme.blue500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRecommendedProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      width: double.maxFinite,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 16.h,
          children: List.generate(
            controller.recommendedList.length,
            (index) {
              RecommendedModel model = controller.recommendedList[index];
              return RecommendedProductsItemWidget(
                model: model,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderSummary(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: AppDecoration.outlineBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
            ),
            child: Container(
              width: 108.h,
              height: 31.h,
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 4.h,
              ),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder4,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: controller.decreaseQuantity,
                    child: Text(
                      "-".tr,
                      style: CustomTextStyles.labelLargeGray80002,
                    ),
                  ),
                  GetBuilder<ProductDetailsController>(
                    builder: (c) => Text(
                      "${c.quantity.value}",
                      style: CustomTextStyles.labelLargeGray80002,
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.updateQuantity(context),
                    child: Text(
                      "+".tr,
                      style: CustomTextStyles.labelLargeGray80002,
                    ),
                  )
                ],
              ),
            ),
          ),
          // SizedBox(width: 28.h),
          CustomElevatedButton(
            buttonStyle: ElevatedButton.styleFrom(
              // backgroundColor: Colors.blue, // Background color
              // foregroundColor: Colors.white, // Text color
              elevation: 0, // Elevation of the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // Rounded corners
              ),
            ),
            width: 222.h,
            height: 48.h,
            text: "lbl_place_order".tr,
            rightIcon: CustomIconButton(
                height: 24.h,
                width: 24.h,
                child: Icon(
                  color: Colors.white,
                  Icons.arrow_forward_ios_sharp,
                  size: 16.h,
                )),
          )
        ],
      ),
    );
  }

  onTapColumnone() {
    Get.toNamed(""
        // AppRoutes.cdProjectTrackingMobileFourScreen,
        );
  }
}
