import 'package:fazaa/core/utils/colors.dart';
import 'package:fazaa/core/utils/constats.dart';
import 'package:fazaa/core/widgets/custom_app_bar.dart';
import 'package:fazaa/core/widgets/custom_button.dart';
import 'package:fazaa/features/auth/widgets/top_circle_avater.dart';
import 'package:fazaa/features/auth/register/presentation/views/customer_register_page.dart';
import 'package:fazaa/features/auth/register/presentation/views/widgets/register_type_card.dart';
import 'package:flutter/material.dart';

class RegisterTypePage extends StatefulWidget {
  const RegisterTypePage({super.key});
  static const String routeName = 'registerType';

  @override
  State<RegisterTypePage> createState() => _RegisterTypePageState();
}

class _RegisterTypePageState extends State<RegisterTypePage> {
  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: "نوع التسجيل", back_btn: true),
              SizedBox(height: size.height * 0.14),
              const TopCircleAvater(icon: Icons.person_add_alt_1),
              const SizedBox(height: kSizedBoxHeight * 1.5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Text(
                  "اختر نوع حسابك",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.shortestSide * 0.07,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: kSizedBoxHeight),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RegisterTypeCard(
                        title: "زبون",
                        icon: Icons.person_outline,
                        isSelected: _selectedType == 'customer',
                        onTap: () =>
                            setState(() => _selectedType = 'customer')),
                    RegisterTypeCard(
                        title: "حرفي",
                        icon: Icons.handyman_outlined,
                        isSelected: _selectedType == 'craftsman',
                        onTap: () =>
                            setState(() => _selectedType = 'craftsman')),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomButton(
                  text: "متابعة",
                  onPressed: _selectedType != null
                      ? () {
                          Navigator.pushNamed(
                              context, CustomerRegisterPage.routeName);
                        }
                      : null,
                  verticalHieght: 16,
                  horizontalWidth: 0,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
