import 'dart:async';
import 'dart:developer';

import 'package:fazaa/core/widgets/custom_button.dart';
import 'package:fazaa/features/auth/widgets/top_circle_avater.dart';
import 'package:fazaa/features/auth/login/presentation/views/widgets/verification_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constats.dart';

class NumberVerificationPage extends StatefulWidget {
  const NumberVerificationPage({super.key, required this.phoneNumber});
  static const String routeName = "numberVerification";
  final String phoneNumber;

  @override
  State<NumberVerificationPage> createState() => _NumberVerificationPageState();
}

class _NumberVerificationPageState extends State<NumberVerificationPage> {
  late Timer _timer;
  int _remainingTime = 60;
  bool _canResend = false;
  String _otpValue = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _canResend = false;
    _remainingTime = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() => _remainingTime--);
      } else {
        _timer.cancel();
        setState(() => _canResend = true);
      }
    });
  }

  void _resendCode() {
    if (_canResend) {
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              const TopCircleAvater(icon: Icons.message_outlined),
              const SizedBox(height: kSizedBoxHeight),
              Text(
                "ادخل الرمز للاستمرار برحلتك",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: kSizedBoxHeight),
              VerificationMsg(phoneNumber: widget.phoneNumber),
              SizedBox(height: size.height * 0.05),
              Directionality(
                textDirection: TextDirection.ltr,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: OtpTextField(
                    onSubmit: (value) {
                      setState(() => _otpValue = value);
                      log(value);
                    },
                    borderColor: AppColors.primary,
                    focusedBorderColor: AppColors.primary,
                    cursorColor: AppColors.primary,
                    fieldWidth: size.width * 0.15,
                    showFieldAsBox: true,
                    numberOfFields: 5,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    textStyle: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              const SizedBox(height: kSizedBoxHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لم تستلم الرمز؟",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: _canResend ? _resendCode : null,
                    child: Text(
                      _canResend
                          ? "إعادة الإرسال"
                          : "إعادة الإرسال (${_remainingTime.toString().padLeft(2, '0')})",
                      style: TextStyle(
                        color: _canResend ? AppColors.primary : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kSizedBoxHeight),
              CustomButton(
                text: "التحقق من الرقم",
                onPressed: _otpValue.length != 5 ? null : () {},
                verticalHieght: KVerticalPadding,
                horizontalWidth: KHorizontalPadding,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
