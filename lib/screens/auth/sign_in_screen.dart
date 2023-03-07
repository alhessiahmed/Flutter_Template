import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/images_manager.dart';
import '../../core/constants/text_styles_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../getx/controllers/auth/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantsManager.authAppBar,
      body: Stack(
        children: [
          Form(
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsets.all(24.w),
              children: [
                Text(
                  'sign_in'.tr,
                  style: TextStylesManager.title,
                ),
                SizedBox(height: 14.h),
                Text(
                  'sign_in_subtitle'.tr,
                  style: TextStylesManager.subTitle,
                ),
                SizedBox(height: 24.h),
                OutlinedButton.icon(
                  onPressed: () async {
                    await _performLoginWithGoogle();
                  },
                  icon: Image.asset(
                    ImagesManager.google,
                    height: 40.h,
                  ),
                  label: Text('google_sign_in'.tr),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'or'.tr,
                        style: TextStyle(
                          color: ColorsManager.subtitleColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                TextFieldWidget(
                  label: 'phone_number'.tr,
                  hintText: 'phone_number'.tr,
                  controller: controller.phoneController,
                  isPhone: true,
                ),
                SizedBox(height: 16.h),
                Obx(
                  () => TextFieldWidget(
                    label: 'password'.tr,
                    hintText: 'password'.tr,
                    suffixIcon: Obx(
                      () => IconButton(
                        onPressed: () {
                          controller.passwordVisible(
                              !controller.passwordVisible.value);
                        },
                        icon: controller.passwordVisible.value
                            ? Icon(
                                Icons.visibility_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              ),
                      ),
                    ),
                    obscureText: !controller.passwordVisible.value,
                    controller: controller.passwordController,
                    isPassword: true,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Obx(() => Checkbox(
                          // fillColor: MaterialStateProperty.all(
                          //     ColorsManager.lightGrey),
                          // checkColor: Colors.cyan,
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe(!controller.rememberMe.value);
                          },
                        )),
                    Text('remember_me'.tr),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesManager.forgetPasswordScreen);
                      },
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 14.sp),
                      ),
                      child: Text('forget_password'.tr),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      controller.isLogging(true);
                      await _performLogin();
                    }
                  },
                  child: Text('new_sign_in'.tr),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have_no_account'.tr,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(RoutesManager.signUpScreen);
                      },
                      child: Text(
                        'sign'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isLogging.value,
              child: const LoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performLogin() async {}

  Future<void> _performLoginWithGoogle() async {}
}
