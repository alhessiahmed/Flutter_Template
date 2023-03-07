import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../getx/controllers/auth/verification_controller.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/constants/text_styles_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/verify_field_widget.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantsManager.authAppBar,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'verify_code'.tr,
                  style: TextStylesManager.title,
                ),
                SizedBox(height: 14.h),
                Text(
                  '${'verify_subtitle'.tr} ',
                  style: TextStylesManager.subTitle,
                ),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  height: 80.h,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child:
                        GetBuilder<VerificationController>(builder: (context) {
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 20.w,
                        ),
                        children: [
                          VerifyFieldWidget(
                            autofocus: true,
                            codeController: controller.firstCodeTextController,
                            focusNode: controller.firstFocusNode,
                            filled: controller
                                .firstCodeTextController.value.text.isNotEmpty,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.secondFocusNode.requestFocus();
                              }
                              controller.updateCode();
                              controller.update();
                              log(value);
                              log(controller.code.value);
                            },
                          ),
                          VerifyFieldWidget(
                            codeController: controller.secondCodeTextController,
                            focusNode: controller.secondFocusNode,
                            filled: controller
                                .secondCodeTextController.value.text.isNotEmpty,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.thirdFocusNode.requestFocus();
                              } else {
                                controller.firstFocusNode.requestFocus();
                              }
                              controller.updateCode();
                              controller.update();
                              log(value);
                              log(controller.code.value);
                            },
                          ),
                          VerifyFieldWidget(
                            codeController: controller.thirdCodeTextController,
                            focusNode: controller.thirdFocusNode,
                            filled: controller
                                .thirdCodeTextController.value.text.isNotEmpty,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.fourthFocusNode.requestFocus();
                              } else {
                                controller.secondFocusNode.requestFocus();
                              }
                              controller.updateCode();
                              controller.update();
                              log(value);
                              log(controller.code.value);
                            },
                          ),
                          VerifyFieldWidget(
                            codeController: controller.fourthCodeTextController,
                            focusNode: controller.fourthFocusNode,
                            filled: controller
                                .fourthCodeTextController.value.text.isNotEmpty,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.thirdFocusNode.requestFocus();
                              }
                              controller.updateCode();
                              controller.update();
                              log(value);
                              log(controller.code.value);
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'had_no_code'.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Obx(
                      () => IgnorePointer(
                        ignoring: controller.counter.value != 0,
                        child: TextButton(
                          onPressed: () {
                            controller.setTimer();
                          },
                          child: Text(
                            'resend'.tr,
                            style: TextStyle(
                              color: controller.counter.value == 0
                                  ? ColorsManager.secondary
                                  : ColorsManager.disabled,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Obx(() => Text(
                        '${controller.counter.value ~/ 60} : ${controller.counter.value - (controller.counter.value ~/ 60) * 60}',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: controller.counter.value == 0
                              ? ColorsManager.disabled
                              : ColorsManager.secondary,
                          fontSize: 16.sp,
                        ),
                      )),
                ),
                const Spacer(flex: 1),
                Obx(() => IgnorePointer(
                      ignoring: controller.code.value.length != 4,
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.toNamed(RoutesManager.resetPasswordScreen);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: controller.code.value.length != 4
                                ? ColorsManager.disabled
                                : ColorsManager.primary),
                        child: Text('send'.tr),
                      ),
                    )),
                const Spacer(flex: 2),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isResetting.value,
              child: const LoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
