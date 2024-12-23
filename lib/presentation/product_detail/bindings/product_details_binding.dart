import 'package:get/get.dart';
import 'package:pharmaconnect/presentation/product_detail/controller/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}
