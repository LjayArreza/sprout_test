import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:sprout_test/app/config/color_constants.dart';
import 'package:sprout_test/app/core/routes/app_pages.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furpals',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.whiteColor,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.blackColor,
          ),
          iconTheme: IconThemeData(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      defaultTransition: Transition.fade,
      initialRoute: Routes.PRODUCTS_LIST_SCREEN,
      getPages: AppPages.pages,
    );
  }
}
