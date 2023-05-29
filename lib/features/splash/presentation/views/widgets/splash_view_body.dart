import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/asstes_data.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_splash_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scalingAnimation;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
          animation: scalingAnimation,
          builder: (context, _) {
            return ScaleTransition(
              scale: scalingAnimation,
              child: Image.asset(AssetsData.logo),
            );
          },
        ),
        SlidingSplashText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initAnimations() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);

    scalingAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).go(AppRouter.searchHomeView);
      },
    );
  }
}
