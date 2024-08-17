import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/data.dart';
import 'package:flutter_wallet_app/core/styles.dart';
import 'package:flutter_wallet_app/core/widgets/page_indicator.dart';
import 'package:flutter_wallet_app/core/widgets/wallet_side.dart';
import 'package:flutter_wallet_app/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> rotationAnimation;
  late final PageController pageController;
  static const viewportFraction = 0.7;
  int activeIndex = 0;

  @override
  void initState() {
    pageController = PageController(viewportFraction: viewportFraction);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
    rotationAnimation = Tween<double>(begin: 0, end: 30 * pi / 180).animate(
      curvedAnimation,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final itemWidth = screenSize.width * viewportFraction;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'My Wallet',
                style: TextStyle(fontSize: 35, color: AppColors.onWhite),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    left: -250 + 40,
                    width: 250,
                    top: -32,
                    bottom: -32,
                    child: WalletSide(),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onTapDown: (_) => animationController.forward(),
                      onTapUp: (_) => animationController.reverse(),
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: onBoardingItems.length,
                        onPageChanged: (value) {
                          setState(() {
                            activeIndex = value;
                          });
                          animationController.forward().then(
                            (value) {
                              animationController.reverse();
                            },
                          );
                        },
                        itemBuilder: (context, index) {
                          return AnimatedScale(
                            scale: index == activeIndex ? 1 : 0.8,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.onBlack,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: AssetImage(
                                        onBoardingItems[index].image),
                                    fit: BoxFit.fitWidth),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: -250 + 35,
                    width: 250,
                    top: -30,
                    bottom: -30,
                    child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(rotationAnimation.value),
                          alignment: Alignment.center,
                          child: const WalletSide(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: (screenSize.width - itemWidth) / 2,
                right: (screenSize.width - itemWidth) / 2,
                top: 40,
                bottom: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildItemInfo(activeIndex: activeIndex),
                  PageIndicator(
                    length: onBoardingItems.length,
                    activeIndex: activeIndex,
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: AppColors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItemInfo({int activeIndex = 0}) {
    return [
      Center(
        child: Text(
          onBoardingItems[activeIndex].title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.onWhite,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Center(
        child: Text(
          onBoardingItems[activeIndex].subTitle,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.onWhite,
          ),
        ),
      ),
    ];
  }
}
