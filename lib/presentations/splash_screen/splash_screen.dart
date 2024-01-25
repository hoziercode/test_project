import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/logic/providers/splash_screen_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashScreenProvider(ctx: context),
      child: Consumer<SplashScreenProvider>(
        builder: (context, splashScreenProvider, child) {
          return const Scaffold(
            body: Column(),
          );
        },
      ),
    );
  }
}
