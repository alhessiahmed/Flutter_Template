import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../getx/controllers/auth/sign_up_controller.dart';

import '../../core/constants/images_manager.dart';
import '../../core/constants/text_styles_manager.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

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
                  'create_account'.tr,
                  style: TextStylesManager.title,
                ),
                SizedBox(height: 14.h),
                Text(
                  'sign_up_subtitle'.tr,
                  style: TextStylesManager.subTitle,
                ),
                SizedBox(height: 24.h),
                OutlinedButton.icon(
                  onPressed: () async {
                    // controller.isLogging(true);
                    // await _performLoginWithGoogle();
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
                SizedBox(height: 24.h),
                TextFieldWidget(
                  label: 'full_name'.tr,
                  hintText: 'full_name'.tr,
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: ColorsManager.subtitleColor,
                    size: 24.h,
                  ),
                  controller: controller.nameController,
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
                          value: controller.agreeConditions.value,
                          onChanged: (value) {
                            controller.agreeConditions(
                                !controller.agreeConditions.value);
                          },
                        )),
                    Text(
                      'agree_with'.tr,
                      style:
                          const TextStyle(color: ColorsManager.subtitleColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesManager.termsConditionsScreen);
                      },
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 14.sp),
                      ),
                      child: Text('terms_conditions'.tr),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Obx(() => IgnorePointer(
                      ignoring: !controller.agreeConditions.value,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (controller.formKey.currentState!.validate()) {
                            controller.isRegistering(true);
                            await _performSignUp();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.agreeConditions.value
                              ? ColorsManager.primary
                              : ColorsManager.disabled,
                        ),
                        child: Text('new_sign_in'.tr),
                      ),
                    )),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have_account'.tr,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(RoutesManager.signInScreen);
                      },
                      child: Text(
                        'sign_in'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isRegistering.value,
              child: const LoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performSignUp() async {}
}
