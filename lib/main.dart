import 'package:erp/utils/app_colors.dart';
import 'package:erp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Erp',

        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.primaryColorStatic),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.white,
          fontFamily: GoogleFonts.workSans().fontFamily,
        ),
        // initialBinding: InitialBindings(),
        initialRoute: Routes.home,
        getPages: Routes.pages,
      ),
    );
  }
}
