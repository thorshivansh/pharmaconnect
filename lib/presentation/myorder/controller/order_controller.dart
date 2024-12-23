import '../../../core/app_export.dart';
import '../model/orderlist_model.dart';

class OrderController extends GetxController {
  var oderList = [
    OrderListItemModel(
        orderId: "Order #123456",
        deliveredOn: " on 21 Apr, 24",
        items: "+5 items",
        status: 0,
        orderImage: ImageConstant.imgImage5983),
    OrderListItemModel(
        orderId: "Order #123456",
        deliveredOn: " on 21 Apr, 24",
        items: "+5 items",
        status: 1,
        orderImage: ImageConstant.imgImage5983),
  ];
}
