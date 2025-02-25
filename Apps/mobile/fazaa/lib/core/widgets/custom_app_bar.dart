import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constats.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.back_btn,
  });
  final String title;
  final bool back_btn;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: KHorizontalPadding + 4),
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          back_btn
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    size: 20,
                    color: AppColors.background,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : const SizedBox(
                  height: 50,
                  width: 50,
                ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
