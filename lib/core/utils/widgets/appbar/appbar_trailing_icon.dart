import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/utils/widgets/custom_image_view.dart';
import '/core/app_export.dart';

class AppbarTrailingImage extends StatelessWidget {
  AppbarTrailingImage(
      {Key? key,
      this.imagePath,
      this.height,
      this.width,
      this.onTap,
      this.margin})
      : super(
          key: key,
        );
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath!,
          height: height ?? 20.h,
          width: width ?? 20.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
