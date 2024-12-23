import 'package:flutter/material.dart';
import 'package:pharmaconnect/core/app_export.dart';
import 'package:pharmaconnect/core/utils/validators.dart';
import 'package:pharmaconnect/core/utils/widgets/appbar/custom_appbar.dart';
import 'package:pharmaconnect/core/utils/widgets/custom_textformfield.dart';

import 'controller/profile_controller.dart';

class MyProfilePage extends GetView<MyProfileController> {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context);
    Get.put(MyProfileController());
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: SafeArea(
        child: Form(
          // key: controller.formKey,
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillGray,
            child: Column(
              children: [
                buildHeaderNavigation(
                  text: 'My Profile',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: 660.h,
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 16.h,
                        right: 16.h,
                      ),
                      child: FutureBuilder(
                          future: controller.loadProfile(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Obx(() => controller.loading.value
                                  ? const Center(
                                      child: SizedBox(
                                          // height: 10,
                                          child: CircularProgressIndicator
                                              .adaptive()))
                                  : Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        _buildProfileSection(
                                            controller.nameController.text),
                                        SizedBox(height: 12.h),
                                        _buildNameInputSection(),
                                        SizedBox(height: 20.h),
                                        _buildPhoneInputSection(),
                                        SizedBox(height: 20.h),
                                        _buildEmailInputSection(),
                                        SizedBox(height: 20.h),
                                        _buildPractitionerIdInputSection(),
                                        SizedBox(height: 20.h),
                                        _buildBillingAddressInputSection(),
                                        SizedBox(height: 20.h),
                                        controller.enabledForEdit.value
                                            ? CustomOutlinedButton(
                                                onPressed: () {
                                                  controller.updateProfile(
                                                      controller
                                                          .inputoneController
                                                          .text);
                                                },
                                                text: 'Save',
                                                decoration: BoxDecoration(
                                                    color: appTheme.teal6004c),
                                              )
                                            : const SizedBox()
                                      ],
                                    ));
                            } else {
                              return const SizedBox();
                            }
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildHeaderSection() {
  //   return SizedBox(
  //     width: double.maxFinite,
  //     child: Container(
  //       width: double.maxFinite,
  //       decoration: AppDecoration.outline.copyWith(
  //         borderRadius: BorderRadiusStyle.customBorderBL20,
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           CustomAppBar(
  //             leadingWidth: 36.h,
  //             title: Text(
  //               'My Profile',
  //               style: theme.textTheme.titleMedium!.copyWith(
  //                 color: theme.colorScheme.onErrorContainer,
  //               ),
  //             ),
  //             styleType: Style.bgGradientnameteal300nameteal600,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //
  Widget _buildProfileSection(String name) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAvatar,
            height: 72.h,
            width: 72.h,
            radius: BorderRadius.circular(
              36.h,
            ),
            alignment: Alignment.center,
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.tr,
                  style: CustomTextStyles.titleMediumBluegray70001,
                ),
                SizedBox(height: 12.h),
                controller.enabledForEdit.value
                    ? CustomOutlinedButton(
                        onPressed: () {
                          controller.enabledForEdit.value =
                              !controller.enabledForEdit.value;
                        },
                        height: 28.h,
                        width: 88.h,
                        text: "Cancel Edit".tr,
                        buttonTextStyle: CustomTextStyles.bodySmallBlack90012,
                      )
                    : CustomOutlinedButton(
                        onPressed: () {
                          controller.enabledForEdit.value =
                              !controller.enabledForEdit.value;
                        },
                        height: 28.h,
                        width: 88.h,
                        text: "lbl_edit_details".tr,
                        buttonTextStyle: CustomTextStyles.bodySmallBlack90012,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNameInputSection() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_name".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 6.h),
          CustomTextFormField(
            enabled: controller.enabledForEdit.value,
            controller: controller.nameController,
            hintText: "NA".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 10.h,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneInputSection() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_phone".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 6.h),
          CustomTextFormField(
            enabled: controller.enabledForEdit.value,
            controller: controller.phoneController,
            hintText: "NA".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 10.h,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInputSection() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_email".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 6.h),
          CustomTextFormField(
            enabled: controller.enabledForEdit.value,
            controller: controller.emailController,
            hintText: "NA".tr,
            textInputType: TextInputType.emailAddress,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 10.h,
            ),
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  Widget _buildPractitionerIdInputSection() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_practioner_id".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 6.h),
          CustomTextFormField(
            enabled: controller.enabledForEdit.value,
            controller: controller.inputoneController,
            hintText: "NA".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 10.h,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBillingAddressInputSection() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_billing_address".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 4.h),
          CustomTextFormField(
            enabled: controller.enabledForEdit.value,
            controller: controller.addressController,
            hintText: "NA".tr,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 10.h,
            ),
          )
        ],
      ),
    );
  }
}
