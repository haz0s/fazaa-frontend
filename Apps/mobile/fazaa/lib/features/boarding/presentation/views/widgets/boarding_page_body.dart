import 'package:fazaa/core/utils/colors.dart';
import 'package:fazaa/core/utils/constats.dart';
import 'package:fazaa/core/widgets/custom_button.dart';
import 'package:fazaa/features/auth/login/presentation/views/login_page.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';

class BoardingPageBody extends StatelessWidget {
  const BoardingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: kSizedBoxHeight,
            ),
            Center(
                child: Text(
              "!افضل ايدي عاملة لك",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                  fontSize: size.shortestSide * 0.07),
            )),
            const SizedBox(
              height: kSizedBoxHeight,
            ),
            Center(
                child: Text(
              "مع فزعة للخدمات المنزلية سوف تحصل على افضل خدمة صيانة من قبل المختصين باسرع وقت وأعلى كفائة",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackText,
                  fontSize: size.shortestSide * 0.04),
              textAlign: TextAlign.center,
            )),
            const SizedBox(
              height: kSizedBoxHeight,
            ),
            Image.asset(
              AssetsData.boardingImage,
            ),
            const SizedBox(
              height: kSizedBoxHeight,
            ),
            CustomButton(
                text: "فلنبدأ معاً",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routName);
                },
                verticalHieght: KVerticalPadding,
                horizontalWidth: KHorizontalPadding,
                color: AppColors.primary)
          ],
        ),
      ),
    );
  }
}
