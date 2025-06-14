import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: const Color(0xFFF9FAFB),
        pages: [
          PageViewModel(
            title: "Schedule Matches",
            body: "Easily find teams and book cricket matches around you.",
            image: buildLottie(
                "https://assets3.lottiefiles.com/packages/lf20_iwmd6pyr.json"),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: "Manage Teams",
            body: "Handle team players, match info, and share results.",
            image: buildLottie(
                "https://assets10.lottiefiles.com/packages/lf20_x62chJ.json"),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: "Join Cricket Community",
            body: "Connect with other local cricket lovers & clubs.",
            image: buildLottie(
                "https://assets10.lottiefiles.com/packages/lf20_touohxv0.json"),
            decoration: pageDecoration(),
            footer: ElevatedButton(
              onPressed: () => goToHome(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        onDone: () => goToHome(context),
        onSkip: () => goToHome(context),
        showSkipButton: true,
        skip: const Text("Skip", style: TextStyle(color: Colors.deepPurple)),
        next: const Icon(Icons.arrow_forward, color: Colors.deepPurple),
        done: const Text("Done",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.deepPurple)),
        dotsDecorator: DotsDecorator(
          size: const Size(10, 10),
          color: Colors.grey.shade300,
          activeColor: Colors.deepPurple,
          activeSize: const Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        animationDuration: 500,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void goToHome(BuildContext context) {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  Widget buildLottie(String url) => Center(
        child: Lottie.network(url, width: 300, fit: BoxFit.contain),
      );

  PageDecoration pageDecoration() => PageDecoration(
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
        bodyTextStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.grey.shade700,
        ),
        imagePadding: const EdgeInsets.all(16),
        contentMargin: const EdgeInsets.all(16),
        pageColor: const Color(0xFFF9FAFB),
      );
}
