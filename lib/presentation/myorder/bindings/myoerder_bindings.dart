import 'package:get/get.dart';
import 'package:pharmaconnect/presentation/myorder/controller/order_controller.dart';

class MyOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
  }
}
