import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class TopCircleAvater extends StatelessWidget {
  const TopCircleAvater({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: CircleAvatar(
        maxRadius: size.shortestSide * 0.14,
        backgroundColor: AppColors.secondary,
        child: Icon(
          icon,
          size: size.shortestSide * 0.14,
          color: Colors.white,
        ),
      ),
    );
  }
}
