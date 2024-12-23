import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/recommended_model.dart';

class ProductDetailsController extends GetxController {
  List<RecommendedModel> recommendedList = [
    RecommendedModel(
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5981.png",
      productName: "Revital Cal 500mg Strip Of 15 Tablets",
      id: "1",
    ),
    RecommendedModel(
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5982.png",
      productName: "Recombigen Dr. ORG New 3 In 1 Vaporizer",
      id: "2",
    ),
  ];
  Rx<int> sliderIndex = 0.obs;
  Rx<int> quantity = 1.obs;

  void updateQuantity(BuildContext context) {
    if (quantity.value < 12) {
      quantity.value++;
    } else {
      if (context.mounted) {
        CherryToast.info(
          toastDuration: const Duration(milliseconds: 2000),
          toastPosition: Position.center,
          title: Text("msg_you_have_reached".tr,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ).show(context);
      }
    }
    update();
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      update();
    }
  }
}
