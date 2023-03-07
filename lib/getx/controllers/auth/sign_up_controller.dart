import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;
  final agreeConditions = false.obs;

  final isRegistering = false.obs;
}
