import 'package:complete_advanced_flutter/presentation/resource/assets_manager.dart';
import 'package:complete_advanced_flutter/presentation/resource/color_manager.dart';
import 'package:complete_advanced_flutter/presentation/resource/string_manager.dart';
import 'package:complete_advanced_flutter/presentation/resource/values_manager.dart';
import 'package:complete_advanced_flutter/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, AssetsRes.ONBOARDING_LOGO1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, AssetsRes.ONBOARDING_LOGO2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, AssetsRes.ONBOARDING_LOGO3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, AssetsRes.ONBOARDING_LOGO4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnboardingPage(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
            ),
            _getButtonSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getButtonSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p18),
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(AssetsRes.LEFT_ARROW_IC),
              ),
            ),
            onTap: () {
              _pageController.animateToPage(
                  _getPreviousIndex(),
                  duration: const Duration(milliseconds:  DurationConstant.d300),
                  curve: Curves.bounceInOut);
            },
          ),
          Row(
            children: List.generate(_list.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: index == _currentIndex
                    ? SvgPicture.asset(AssetsRes.HOLLOW_CIRCLE_IC)
                    : SvgPicture.asset(AssetsRes.SOLID_CIRCLE_IC),
              );
            }),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p18),
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(AssetsRes.RIGHT_ARROW_IC),
              ),
            ),
            onTap: () {
              _pageController.animateToPage(
                  _getNextIndex(),
                  duration: const Duration(milliseconds:  DurationConstant.d300),
                  curve: Curves.bounceInOut);
            },
          ),
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    print('Get previous index');
    int previousIndex = _currentIndex - 1;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1; // Loop
    }
    return previousIndex;
  }

  int _getNextIndex() {
    print('Get next index');

    int nextIndex = _currentIndex + 1;
    if (nextIndex == _list.length) {
      nextIndex = 0; // Loop
    }
    return nextIndex;
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(this._sliderObject, {
    super.key,
  });

  final SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
