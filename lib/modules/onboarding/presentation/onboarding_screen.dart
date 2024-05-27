import 'package:calculator_app_test/modules/onboarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  void _goToNextPageViewItem() {
    if (_currentPage < 4) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  double get screenWidth {
    return MediaQuery.of(context).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(context).size.height;
  }

  final Map<String, String> firstPageItemInfo = {
    'image': 'assets/images/mathematics_x2.png',
    'text': 'We’ll solve all maths problems and show the steps',
    'description':
        "We have a wide curriculum for WAEC and British Mathematics curriculum, so we can solve a whole lot of math problems.",
  };
  final Map<String, String> secondPageItemInfo = {
    'image': 'assets/images/mathematics_x2.png',
    'text': 'Solve anything in 3 simple steps',
    'description':
        'Select the top or sub-topic, enter the variables and hit calculate button and you’ll see all the solutions.',
  };
  final Map<String, String> thirdPageItemInfo = {
    'image': 'assets/images/mathematics_x2.png',
    'text': 'Suscribe to Premium to access all features & complex solutions',
    'description':
        'From GP Calculator, Live Help from Tutors, Complex Science Solutions, Access all our premium features in all subjects with a small fee.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffe6ede7), body: Column( children: [
      SizedBox(
                height: screenHeight * 0.6798,
                child: PageView(
                  clipBehavior: Clip.none,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    PageViewItem(
                      image: firstPageItemInfo['image']!,
                      firstBlueHighlightedText:
                          firstPageItemInfo['firstBlueHighlightedText']!,
                      redHighlightedText:
                          firstPageItemInfo['redHighlightedText']!,
                      secondBlueHighlightedText:
                          firstPageItemInfo['secondBlueHighlightedText']!,
                      description: firstPageItemInfo['description']!,
                      screenHeight: screenHeight,
                    ),
                    PageViewItem(
                      image: secondPageItemInfo['image']!,
                      firstBlueHighlightedText:
                          secondPageItemInfo['firstBlueHighlightedText']!,
                      redHighlightedText:
                          secondPageItemInfo['redHighlightedText']!,
                      secondBlueHighlightedText:
                          secondPageItemInfo['secondBlueHighlightedText']!,
                      description: secondPageItemInfo['description']!,
                      screenHeight: screenHeight,
                    ),
                    PageViewItem(
                      image: thirdPageItemInfo['image']!,
                      firstBlueHighlightedText:
                          thirdPageItemInfo['firstBlueHighlightedText']!,
                      redHighlightedText:
                          thirdPageItemInfo['redHighlightedText']!,
                      secondBlueHighlightedText:
                          thirdPageItemInfo['secondBlueHighlightedText']!,
                      description: thirdPageItemInfo['description']!,
                      screenHeight: screenHeight,
                    ),
             
                  ],
                ),
              ),
    ],),);
  }
}
