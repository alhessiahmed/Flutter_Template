import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';

import '../../core/constants/images_manager.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      appBar: AppBar(
        title: Text('terms_conditions'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                      color: ColorsManager.shadow,
                      blurRadius: 5.r,
                      offset: Offset(0, 2.h)),
                ],
              ),
              child: ListView(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  Image.asset(
                    ImagesManager.logo,
                    height: 78.h,
                  ),
                  Divider(
                    thickness: 1,
                    height: 40.h,
                    color: ColorsManager.dividerColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 32.w),
                    child: Text(
                      'terms_conditions'.tr,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF525961),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'terms_conditions_content'.tr,
                      style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.8,
                        color: const Color(0xCC494545),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const Spacer(flex: 3),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: ElevatedButton(
              onPressed: () async {
                Get.back();
              },
              child: Text('agree'.tr),
            ),
          ),
          // const Spacer(flex: 2),
        ],
      ),
    );
  }
}
