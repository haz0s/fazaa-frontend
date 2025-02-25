import 'package:flutter/material.dart';

import 'widgets/boarding_page_body.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});
  static const String routName = "boarding";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BoardingPageBody(),
    );
  }
}
