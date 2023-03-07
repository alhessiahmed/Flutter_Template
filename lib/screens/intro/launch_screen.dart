import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/images_manager.dart';
import '../../core/routes/routes_manager.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.offNamed(
        //   (true) ? RoutesManager.onboardingScreen : RoutesManager.homeScreen,
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            ImagesManager.logo,
            fit: BoxFit.cover,
            // height: 577.h,
            width: Get.width,
          ),
          SizedBox(height: 70.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'store',
                style: TextStyle(
                  fontSize: 21.sp,
                  color: ColorsManager.logoDark,
                ),
              ),
              Text(
                'Magic',
                style: TextStyle(
                  fontSize: 40.sp,
                  color: ColorsManager.logo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
