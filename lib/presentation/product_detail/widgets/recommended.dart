import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/utils/widgets/custom_icon_button.dart';
import 'package:pharmaconnect/presentation/product_detail/product_details_page.dart';

import '../../../core/app_export.dart';
import '../model/recommended_model.dart';

class RecommendedProductsItemWidget extends StatelessWidget {
  const RecommendedProductsItemWidget({super.key, required this.model});
  final RecommendedModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 162.h,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: AppDecoration.fillDeepOrange.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL38,
                color: Color(model.colorCode ?? 0XFFFFD3D3).withOpacity(0.5)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 86.h,
                    height: 16.h,
                    decoration: AppDecoration.fillRed.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderLR8,
                        color: Color(model.colorCode ?? 0XFFFFD3D3)),
                    child: Text(
                      "Alloted: ${model.allotedUnits}",
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodySmall,
                    )),
                SizedBox(height: 4.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: model.imagePath,
                      height: 82.h,
                      width: 102.h,
                      margin: EdgeInsets.only(bottom: 10.h),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 24.h,
                            width: 24.h,
                            decoration: AppDecoration.outlineRedA.copyWith(
                              color: const Color(0x0010676e),
                              borderRadius: BorderRadiusStyle.customBorderBL14,
                            ),
                            child: CustomIconButton(
                                onTap: () {
                                  Get.to(ProductDetailsPage(
                                    model: model,
                                  ));
                                },
                                height: 24.h,
                                width: 24.h,
                                child: Icon(
                                  color: Colors.white,
                                  Icons.arrow_forward_ios_sharp,
                                  size: 7.h,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            model.productName ?? '_',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}
