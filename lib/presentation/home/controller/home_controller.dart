import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:pharmaconnect/presentation/home/model/slider_model.dart';

import '../../../core/app_export.dart';
import '../../product_detail/model/recommended_model.dart';

class HomeController {
  final CarouselSliderController controller = CarouselSliderController();
  Rx<int> sliderIndex = 0.obs;
  RxInt selectedIndex = 0.obs;
  List<SliderModel> sliderModel = [
    SliderModel(
      imagePath: "assets/images/img_rectangle_15.png",
      id: "1",
    ),
    SliderModel(
      imagePath: "assets/images/img_rectangle_16.png",
      id: "2",
    ),
    SliderModel(
      imagePath: "assets/images/img_rectangle_15.png",
      id: "3",
    ),
  ];

  List<RecommendedModel> recommendedList = [
    RecommendedModel(
      colorCode: 0XFFFFE9E9,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5981.png",
      productName: "Revital Cal 500mg Strip Of 15 Tablets",
      id: "1",
    ),
    RecommendedModel(
      colorCode: 0XFFFFF3D0,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5982.png",
      productName: "Recombigen Dr. ORG New 3 In 1 Vaporizer",
      id: "2",
    ),
    RecommendedModel(
      colorCode: 0XFFD9F6FF,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5983.png",
      productName: "Dr. Morepen Blood Pressure Monitor Model Bp 14",
      id: "3",
    ),
    RecommendedModel(
      colorCode: 0XFFDAF7DF,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5984.png",
      productName: "Revital Cal 500mg Strip Of 15 Tablets",
      id: "4",
    ),
    RecommendedModel(
      colorCode: 0XFFFFE9E9,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5981.png",
      productName: "Revital Cal 500mg Strip Of 15 Tablets",
      id: "5",
    ),
    RecommendedModel(
      colorCode: 0XFFFFF3D0,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5982.png",
      productName: "Recombigen Dr. ORG New 3 In 1 Vaporizer",
      id: "6",
    ),
    RecommendedModel(
      colorCode: 0XFFD9F6FF,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5983.png",
      productName: "Dr. Morepen Blood Pressure Monitor Model Bp 14",
      id: "7",
    ),
    RecommendedModel(
      colorCode: 0XFFDAF7DF,
      allotedUnits: "12 units",
      imagePath: "assets/images/img_image_5984.png",
      productName: "Revital Cal 500mg Strip Of 15 Tablets",
      id: "8",
    ),
  ];
}
