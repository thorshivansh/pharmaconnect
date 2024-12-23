import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/app_export.dart';
import 'package:pharmaconnect/core/utils/widgets/appbar/custom_appbar.dart';

import 'controller/order_controller.dart';
import 'model/orderlist_model.dart';
import 'widget/order_list_widget.dart';

// ignore: must_be_immutable
class MyOrderPage extends GetView<OrderController> {
  MyOrderPage({super.key});
  @override
  OrderController controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                buildHeaderNavigation(text: 'My Orders'),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 34.h,
                    right: 16.h,
                  ),
                  child: _buildOrderList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget  Widget
  _buildOrderList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 12.h,
        );
      },
      itemCount: controller.oderList.length,
      itemBuilder: (context, index) {
        OrderListItemModel model = controller.oderList[index];
        return OrderlistItemWidget(
          model,
        );
      },
    );
  }
}
