import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';

class VerificationMsg extends StatelessWidget {
  const VerificationMsg({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text.rich(
        TextSpan(
          text: ":الرجاء ادخال الرقم الذي تم ارساله الى الرقم التالي\n",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.grayText,
          ),
          children: [
            TextSpan(
              text: phoneNumber,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
