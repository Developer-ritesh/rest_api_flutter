import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/routes/routes.dart';
import 'package:rest_api/utils/base_url.dart';
import 'package:rest_api/utils/loader.dart';
import 'package:rest_api/utils/snack_bar.dart';

class SignupController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() {
    if (name.text.isEmpty) {
      customSnackbar('Error', 'Name is required', false);
    } else if (email.text.isEmpty || GetUtils.isEmail(email.text) == false) {
      customSnackbar('Error', 'Enter valid email is required', false);
    } else if (address.text.isEmpty) {
      customSnackbar('Error', 'Address is required', false);
    } else if (password.text.isEmpty) {
      customSnackbar('Error', 'Password is required', false);
    } else {
      // API Call for Registration
      Get.showOverlay(
          asyncFunction: () => startSignUp(), loadingWidget: CustomLoader());
    }
  }

  Future startSignUp() async {
    var response = await http
        .post(Uri.parse('${baseurl}/signup.php'), body: {
      "name": name.text,
      "email": email.text,
      "address": address.text,
      "password": password.text
    });

    print('--> ${response.body}');
    var res = await json.decode(response.body);

    if (res['success']) {
      customSnackbar('Success', res['message'], true);
      Get.to(RoutesClass.dashboard);
    } else {
      customSnackbar('Failed', res['message'], false);
    }
  }
}
