import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constats.dart';
import 'services_grid_item.dart';

class ServicesGrid extends StatelessWidget {
  final List<Map<String, String>> services;
  const ServicesGrid({super.key, required this.services});
  int _getCrossAxisCount(double availableWidth) {
    if (availableWidth > 1000) return 5;
    if (availableWidth > 600) return 4;
    if (availableWidth > 300) return 3;
    return 2;
  }

  double _getChildAspectRatio(double availableWidth) {
    if (availableWidth > 600) return 1.0;
    if (availableWidth > 400) return 0.8;
    return 0.7;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth - 30;
          final crossAxisCount = _getCrossAxisCount(availableWidth);
          final childAspectRatio = _getChildAspectRatio(availableWidth);

          return CustomScrollView(
            slivers: [
              // Title Section
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: kSizedBoxHeight),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: KHorizontalPadding),
                      child: Text(
                        "الخدمات",
                        style: TextStyle(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.sizeOf(context).shortestSide * 0.07,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Grid Section
              SliverPadding(
                padding: const EdgeInsets.all(15),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: childAspectRatio,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ServiceGridItem(
                      serviceName: services[index]['name']!,
                      imagePath: services[index]['image']!,
                    ),
                    childCount: services.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
