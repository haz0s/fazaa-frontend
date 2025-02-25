import 'package:fazaa/core/utils/colors.dart';
import 'package:fazaa/core/utils/constats.dart';
import 'package:fazaa/core/utils/functions.dart';
import 'package:fazaa/core/widgets/custom_button.dart';
import 'package:fazaa/features/auth/login/presentation/views/number_verification_page.dart';
import 'package:fazaa/features/auth/login/presentation/views/widgets/phone_field_widget.dart';
import 'package:fazaa/features/auth/login/presentation/views/widgets/top_circle_avater.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../../core/utils/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routName = "phoneRegister";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final PhoneController controller;
  @override
  void initState() {
    controller = PhoneController(
        initialValue: const PhoneNumber(isoCode: IsoCode.SY, nsn: ""));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: size.height * 0.14,
          ),
          const TopCircleAvater(icon: Icons.phone_outlined),
          const SizedBox(
            height: kSizedBoxHeight,
          ),
          Center(
            child: Text(
              "تسجيل الدخول",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.shortestSide * 0.07,
              ),
            ),
          ),
          const SizedBox(
            height: kSizedBoxHeight,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              ":رقم الهاتف",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          PhoneFieldWidget(controller: controller),
          TextButton(
            onPressed: () {
              //Navigator.pushNamed(context, RegisterPage.routeName);
            },
            child: Text("ليس لديك حساب؟",
                style: Styles.textStyle16.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 0.6,
                  decorationColor: AppColors.primary,
                  color: AppColors.blackText,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: kSizedBoxHeight,
          ),
          CustomButton(
              text: "التحقق من الرقم",
              onPressed: () {
                if (controller.value.nsn.isEmpty) {
                  messages(context, "الرجاء ادخال رقم هاتفك والمحاولة مجدداً",
                      Colors.red);
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NumberVerificationPage(
                                phoneNumber: controller.value.nsn,
                              )));
                }
              },
              verticalHieght: KVerticalPadding,
              horizontalWidth: KHorizontalPadding,
              color: AppColors.primary),
        ],
      )),
    ));
  }
}
