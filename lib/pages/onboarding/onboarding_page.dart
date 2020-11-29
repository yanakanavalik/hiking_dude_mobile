// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../common/assets.dart';
import '../../common/colors.dart';
import '../../common/text_styles.dart';
import '../../elements/button_rounded.dart';
import '../../elements/paging.dart';
import '../../services/navigation/routes.dart';

class Onboarding extends StatefulWidget {
  Onboarding();

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  PageController _controller;
  int _currentPage = 0;
  final _allPagesIndexes = [0, 1, 2];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.white,
        child: SafeArea(
            child: Stack(children: [
          PageView(
            controller: _controller,
            children: _buildOnboardingScreens(),
            onPageChanged: _updateCurrentPage,
          ),
          Positioned(
              child: Container(
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLogoArea(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Paging(_currentPage, _allPagesIndexes),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonRounded(
                                'SIGN UP',
                                () => Navigator.pushNamed(
                                    context, Routes.signUp)),
                            ButtonRounded(
                                'LOGIN',
                                () =>
                                    Navigator.pushNamed(context, Routes.login))
                          ])
                    ])
              ],
            ),
          )),
        ])));
  }

  void _updateCurrentPage(int currentPagePosition) {
    print(currentPagePosition);
    setState(() => _currentPage = currentPagePosition);
  }

  List<Widget> _buildOnboardingScreens() {
    var result = <Widget>[];
    const onboardingTextEntries = [
      'Create your trip plan with places, tickets and important notes',
      'Track the progress of the trip and make changes',
      'Explore others plans and share your'
    ];

    const onboardingImagesEntries = [
      ImageAssets.onboardingFirstImage,
      ImageAssets.onboardingSecondImage,
      ImageAssets.onboardingThirdImage
    ];

    for (var i = 0; i < 3; i++) {
      result.add(_buildOnboardingPage(
          onboardingTextEntries[i], onboardingImagesEntries[i]));
    }

    return result;
  }

  Widget _buildOnboardingPage(String mainText, String backgroudAsset) {
    return Material(
      color: AppColors.white,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          image: DecorationImage(
            image: AssetImage(backgroudAsset),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 90, 20, 30),
        child: Center(
          child: Text(mainText, style: titleTS(), textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildLogoArea() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(ImageAssets.logo, height: 45),
      const SizedBox(width: 14),
      Text('Hiking dude', style: customBoldTS(fontSize: 36))
    ]);
  }
}
