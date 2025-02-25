import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import 'widgets/splash_page_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String routName = "splash";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SplashPageBody(),
    );
  }
}
