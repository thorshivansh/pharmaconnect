import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/app_export.dart';
import 'package:pharmaconnect/core/utils/widgets/custom_icon_button.dart';

import '../model/orderlist_model.dart';

class OrderlistItemWidget extends StatelessWidget {
  const OrderlistItemWidget(this.orderListItemModel, {super.key});
  final OrderListItemModel orderListItemModel;
  // var controller = Get.find<CdProjectTrackingMobileTwoController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderListItemModel.orderId ?? "_",
                  style: CustomTextStyles.bodySmallGray90001,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.h, bottom: 10.h),
                  child: CustomIconButton(
                    child: Icon(
                      Icons.arrow_forward_sharp,
                      size: 14.h,
                      color: appTheme.blue500,
                    ),
                  ),
                )
                // Icon(

                //   height: 14.h,
                //   width: 16.h,
                // )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              thickness: 1.h,
              color: appTheme.gray200,
            ),
          ),
          // SizedBox(height: 8.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32.h,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: const Color(0XFFFFF3D0),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(4.h, 4.h))),
                      child: CustomImageView(
                        fit: BoxFit.contain,
                        imagePath: orderListItemModel.orderImage,
                        height: 29.h,
                        width: 22.h,
                      ),
                    ),
                    SizedBox(
                      width: 4.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                orderListItemModel.status == 0
                                    ? "Delivered"
                                    : "In transit",
                                style: orderListItemModel.status != 0
                                    ? CustomTextStyles.bodySmallBlack900
                                    : CustomTextStyles.bodySmallGreen900
                                        .copyWith(color: Colors.green),
                              ),
                              Text(
                                orderListItemModel.deliveredOn ?? "_",
                                style: CustomTextStyles.bodySmallBlack900,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.h),
                            decoration: AppDecoration.outlineGray10002.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder1,
                            ),
                            child: Text(
                              orderListItemModel.items ?? "-",
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodySmallBlack9008,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      orderListItemModel.status == 0 ? '' : "Track Order",
                      style: CustomTextStyles.labelMediumCyan500.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 6.h)
        ],
      ),
    );
  }
}
