import 'package:fazaa/core/utils/colors.dart';
import 'package:fazaa/core/widgets/custom_nav_bar.dart';
import 'package:fazaa/features/splash/presentation/views/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/utils/routs.dart';

void main() {
  runApp(const FazaaApp());
}

class FazaaApp extends StatelessWidget {
  const FazaaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        fontFamily: "cocon-next-arabic",
      ),
      debugShowCheckedModeBanner: false,
      // home: const SplashPage(),
      initialRoute: CustomBottomNavBar.routeName,
      routes: Routes.routes,
    );
  }
}
