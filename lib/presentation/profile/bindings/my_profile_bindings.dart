import 'package:get/get.dart';
import 'package:pharmaconnect/presentation/profile/controller/profile_controller.dart';

class MyProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileController());
  }
}
