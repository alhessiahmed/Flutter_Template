import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../getx/controllers/auth/forget_password_controller.dart';
import '../../core/constants/text_styles_manager.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantsManager.authAppBar,
      body: Form(
        key: controller.formKey,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'forget_password'.tr,
                    style: TextStylesManager.title,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'forget_password_subtitle'.tr,
                    style: TextStylesManager.subTitle,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  TextFieldWidget(
                    label: 'phone_number'.tr,
                    controller: controller.phoneController,
                    hintText: 'phone_number'.tr,
                    isPhone: true,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        controller.isResetting(false);
                        await _performReset();
                      }
                    },
                    child: Text('send'.tr),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
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
      ),
    );
  }

  Future<void> _performReset() async {
    Get.toNamed(RoutesManager.verificationScreen);
  }
}
