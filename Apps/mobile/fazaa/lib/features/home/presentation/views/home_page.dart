import 'package:fazaa/features/home/presentation/views/widgets/services_grid.dart';
import 'package:flutter/material.dart';
import 'package:fazaa/core/utils/assets_data.dart';

import 'widgets/custom_home_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const String routeName = "home";
  final List<Map<String, String>> services = [
    {'name': 'حداد', 'image': AssetsData.blacksmithImage},
    {'name': 'كهربائي', 'image': AssetsData.electricalImage},
    {'name': 'سباك', 'image': AssetsData.plumberImage},
    {'name': 'نجار', 'image': AssetsData.joinerImage},
    {'name': 'دهان', 'image': AssetsData.paintImage},
    {'name': 'تصليحات', 'image': AssetsData.fixsesImage},
    {'name': 'تنظيف', 'image': AssetsData.cleaningImage},
    {'name': 'تقني', 'image': AssetsData.techImage},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomHomeAppBar(height: size.height * 0.16),
      body: ServicesGrid(services: services),
    );
  }
}
