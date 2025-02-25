import 'package:fazaa/core/utils/colors.dart';
import 'package:fazaa/core/utils/constats.dart';
import 'package:fazaa/core/widgets/custom_button.dart';
import 'package:fazaa/features/auth/login/presentation/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fazaa/core/utils/assets_data.dart';

class BoardingPageBody extends StatelessWidget {
  const BoardingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableHeight = constraints.maxHeight;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Text Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "!افضل ايدي عاملة لك",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackText,
                          fontSize: size.shortestSide * 0.07,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "مع فزعة للخدمات المنزلية سوف تحصل على افضل خدمة صيانة من قبل المختصين باسرع وقت وأعلى كفائة",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackText,
                          fontSize: size.shortestSide * 0.04,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Image Section (Takes 50% of available height)
                SizedBox(
                  height: availableHeight * 0.5,
                  child: Image.asset(
                    AssetsData.boardingImage,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),

                // Bottom Button Section
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: CustomButton(
                    text: "فلنبدأ معاً",
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LoginPage.routName);
                    },
                    verticalHieght: KVerticalPadding,
                    horizontalWidth: KHorizontalPadding,
                    color: AppColors.primary,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
