import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/colors_manager.dart';

class AuthAppBarWidget extends StatelessWidget {
  const AuthAppBarWidget({super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: ColorsManager.textColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    );
  }
}

// final authAppBarTheme = ThemeData(
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Colors.transparent,
//     foregroundColor: ColorsManager.textColor,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarIconBrightness: Brightness.dark,
//     ),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.zero,
//     ),
//   ),
// );

final authAppBar = AppBar(
  backgroundColor: Colors.transparent,
  foregroundColor: ColorsManager.textColor,
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  ),
);
