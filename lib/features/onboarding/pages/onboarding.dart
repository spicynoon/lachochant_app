import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lachochant_app/common/utils/constants.dart';
import 'package:lachochant_app/common/widgets/appstyle.dart';
import 'package:lachochant_app/common/widgets/reusable_text.dart';
import 'package:lachochant_app/common/widgets/width_spacer.dart';
import 'package:lachochant_app/features/onboarding/widgets/page_one.dart';
import 'package:lachochant_app/features/onboarding/widgets/page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.ease);
                          },
                          child: const Icon(
                            Icons.chevron_right_rounded,
                            size: 30,
                            color: AppConst.kLight,
                          ),
                        ),
                        const WidthSpacer(wydth: 5),
                        ReusableText(
                          text: "Skip",
                          style: appstyle(16, AppConst.kLight, FontWeight.w500),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.ease);
                      },
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 2,
                        effect: const WormEffect(
                            dotHeight: 12,
                            dotWidth: 16,
                            spacing: 10,
                            dotColor: AppConst.kGreyDk),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
