import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool loading = RxBool(false);
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref("users");
  // Update profile to Firebase
  Future<void> updateProfile(String userId) async {
    loading.value = true;
    final Map<String, dynamic> data = {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "practitionerId": inputoneController.text,
      "billingAddress": addressController.text,
    };

    try {
      // DatabaseReference _databaseReference =
      //     FirebaseDatabase.instance.ref("users");

      // await _databaseReference.set(data);
      await databaseReference.child("profile").set(data).then((v) {
        enabledForEdit.value = false;
        loading.value = false;
        Get.snackbar("Success", "Profile updated successfully");
      }).onError((e, s) {
        loading.value = false;

        log("", error: e);
        log('', error: s);
        // Get.snackbar("Error", "Failed to update profile: $e");
      });
    } catch (e, s) {
      loading.value = false;

      log("", error: e);
      log('', error: s);
      // Get.snackbar("Error", "Failed to update profile: $e");
    }
  }

  // Default profile data
  final Map<String, String> defaultData = {
    "name": "",
    "phone": "",
    "email": "",
    "practitionerId": "",
    "billingAddress": "",
  };
  // Load profile from Firebase
  // Load profile from Firebase with fallback
  Future<void> loadProfile() async {
    enabledForEdit.value = false;
    try {
      final snapshot = await databaseReference.child("profile").get();

      if (snapshot.exists) {
        print(snapshot.value);
        final data = snapshot.value as Map<dynamic, dynamic>;
        nameController.text = data["name"] ?? defaultData["name"]!;
        phoneController.text = data["phone"] ?? defaultData["phone"]!;
        emailController.text = data["email"] ?? defaultData["email"]!;
        inputoneController.text =
            data["practitionerId"] ?? defaultData["practitionerId"]!;
        addressController.text =
            data["billingAddress"] ?? defaultData["billingAddress"]!;
      } else {
        _useDefaultData();
        // _showToast("No data found. Using default values.");
      }
    } catch (e, s) {
      log("", error: e);
      log('', error: s);
      _useDefaultData();
      // _showToast("Failed to load data. Using default values.");
    }
  }

  // Use default data for controllers
  void _useDefaultData() {
    nameController.text = defaultData["name"]!;
    phoneController.text = defaultData["phone"]!;
    emailController.text = defaultData["email"]!;
    inputoneController.text = defaultData["practitionerId"]!;
    addressController.text = defaultData["billingAddress"]!;
  }

//
  RxBool enabledForEdit = RxBool(false);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController inputoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    inputoneController.dispose();
    addressController.dispose();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
