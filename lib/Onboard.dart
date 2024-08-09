import 'package:ecommerceapp2/authentication/Login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

final introKey = GlobalKey<IntroductionScreenState>();

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    void _onIntroEnd(context) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Login()),
      );
    }

    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: false,
        autoScrollDuration: 3000,
        infiniteAutoScroll: false,
        bodyPadding: EdgeInsets.only(top: 100.h),
        globalHeader: Align(
          alignment: Alignment.topRight,
        ),
        globalFooter: SizedBox(
          width: double.infinity,
          height: 60.h,
        ),
        pages: [
          PageViewModel(
            titleWidget: Text(
              'Choose Products',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            bodyWidget: SizedBox(
              width: 340.w,
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFFA8A8A9),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.28.w,
                  ),
                ),
              ),
            ),
            image: Image.asset('assets/Onboardimages/onboardimg1.png'),
          ),
          PageViewModel(
            titleWidget: Text(
              'Make Payment',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            bodyWidget: SizedBox(
              width: 340.w,
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFFA8A8A9),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.28.w,
                  ),
                ),
              ),
            ),
            image: Image.asset('assets/Onboardimages/onboardimg2.png'),
          ),
          PageViewModel(
            titleWidget: Text(
              'Get Your Order',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            bodyWidget: SizedBox(
              width: 340.w,
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFFA8A8A9),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.28.w,
                  ),
                ),
              ),
            ),
            image: Image.asset('assets/Onboardimages/onboardimg3.png'),
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        // You can override onSkip callback
        showSkipButton: true,
        showBackButton: false,
        back: const Icon(Icons.arrow_back),
        skip: const Text(
          'Skip',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        next:SizedBox(
          width: 50.w,
          height: 22.85.h,
          child: Text(
            'Next',
            textAlign: TextAlign.center,
            style:GoogleFonts.montserrat(
    textStyle: TextStyle(
              color: Color(0xFFF73658),
              fontSize: 18.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),),
        ),
        done:Text(
          'Get Started',
          textAlign: TextAlign.center,
          style:GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Color(0xFFF73658),
            fontSize: 18.sp,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: EdgeInsets.all(16.sp),
        controlsPadding: kIsWeb
            ? EdgeInsets.all(12.0.sp)
            : EdgeInsets.fromLTRB(8.0.w, 4.0.h, 8.0.w, 4.0.h),
        dotsDecorator: DotsDecorator(
          size: Size(10.0.sp, 10.0.sp),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0.sp, 10.0.sp),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
          ),
        ),
      ),
    );
  }
}
