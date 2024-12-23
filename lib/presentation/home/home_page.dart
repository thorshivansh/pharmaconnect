import 'dart:ui';

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/utils/widgets/appbar/custom_appbar.dart';
import 'package:pharmaconnect/presentation/home/controller/home_controller.dart';
import 'package:pharmaconnect/presentation/product_detail/model/recommended_model.dart';
import 'package:pharmaconnect/presentation/product_detail/widgets/recommended.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_export.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillGray,
      child: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildHeaderNavigation(
                leading: Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_pharma".tr,
                          style: CustomTextStyles.titleMediumHelveticaNeueBold,
                        ),
                        TextSpan(
                          text: "lbl_connect".tr,
                          style:
                              CustomTextStyles.titleMediumHelveticaNeueMedium,
                        )
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              buildSlider(),
              SizedBox(height: 6.h),
              Obx(
                () => Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 6.h,
                    child: AnimatedSmoothIndicator(
                      activeIndex: controller.sliderIndex.value,
                      count: controller.sliderModel.length,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                        spacing: 5,
                        dotColor: appTheme.blueGray100,
                        dotHeight: 6.h,
                        dotWidth: 6.h,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Text(
                  "lbl_sample_drugs".tr,
                  style: CustomTextStyles.titleMediumBlack900,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Text(
                  "msg_list_of_drugs_assigned".tr,
                  style: CustomTextStyles.bodySmallGray500,
                ),
              ),
              SizedBox(height: 14.h),
              _buildProductGrid()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 32.h),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            // height: 162.h,
            initialPage: 0,
            autoPlay: true,
            aspectRatio: 20 / 10,
            viewportFraction: 1.0,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              // controller.sliderIndex.value = index;
            },
          ),
          itemCount: controller.sliderModel.length,
          itemBuilder: (context, index, realIndex) {
            return CustomImageView(
              imagePath: controller.sliderModel[index].imagePath,
              height: 224.h,
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: ResponsiveGridListBuilder(
            minItemWidth: 1,
            minItemsPerRow: 2,
            maxItemsPerRow: 2,
            horizontalGridSpacing: 16.h,
            verticalGridSpacing: 16.h,
            builder: (context, items) => ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: items,
                ),
            gridItems:
                List.generate(controller.recommendedList.length, (index) {
              RecommendedModel model = controller.recommendedList[index];
              return RecommendedProductsItemWidget(
                model: model,
              );
            })));
  }

  /// Navigates to the cdProjectTrackingMobileOneScreen when the action is triggered.

  Widget buildSlider() {
    // MediaQuery.of(context);
    return SizedBox(
      height: 162.h,
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            controller: controller.controller,
            options: CarouselOptions(
                height: 162.h,
                autoPlay: true,
                enlargeCenterPage: false,
                aspectRatio: 2.5,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  controller.sliderIndex.value = index;
                  // setState(() {
                  //   _current = index;
                  // });
                }),
          ),
        ),
      ]),
    );
  }

  final List<Widget> imageSliders = HomeController()
      .sliderModel
      .map((item) => Container(
            height: 162.h,
            width: 304.h,
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                child: Image.asset(
                  item.imagePath ?? "",
                  fit: BoxFit.cover,
                )),
          ))
      .toList();
}
