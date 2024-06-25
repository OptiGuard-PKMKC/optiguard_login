import 'package:flutter/material.dart';
import 'package:optiguard/components/onboarding_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skipToLastPage() {
    _pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              OnboardingScreen(
                title: 'Cek kesehatan mata',
                description:
                    'Lindungi mata Anda dari penyakit penyebab kebutaan.',
                backgroundColor: Colors.blue,
              ),
              OnboardingScreen(
                title: 'Pelajari cara mengaja kesehatan mata',
                description:
                    'Baca artikel menarik dan video edukatif untuk menjaga kesehatan mata Anda.',
                backgroundColor: Color.fromARGB(255, 6, 54, 94),
              ),
              OnboardingScreen(
                title: 'Lebih dekat dengan dokter mata',
                description:
                    'Jadwalkan janji temu dengan dokter mata pilihan Anda.',
                backgroundColor: Colors.green,
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
                dotHeight: 5,
                dotWidth: 5,
                expansionFactor: 4,
                spacing: 5,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 2)
                  TextButton(
                    onPressed: _skipToLastPage,
                    child: const Text(
                      'Lewati',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                if (_currentPage == 2)
                  ElevatedButton(
                    onPressed: _navigateToHome,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Mulai',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
