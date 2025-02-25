import 'package:fazaa/core/utils/colors.dart';
import 'package:fazaa/features/splash/presentation/views/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/utils/routs.dart';

void main() {
  runApp(const FazaaApp());
}

class FazaaApp extends StatelessWidget {
  const FazaaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        fontFamily: "cocon-next-arabic",
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      initialRoute: SplashPage.routName,
      routes: Routes.routes,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
