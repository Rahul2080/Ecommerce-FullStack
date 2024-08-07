import 'package:ecommerceapp2/Onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>Onboard()),(route) => false);
    });
    return Scaffold(body: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(width: 124.99.w,
          height: 100.h,
              child: Image.asset("assets/splashphoto.png")),
        ),
        Text("Stylish",  textAlign: TextAlign.center,
          style:GoogleFonts.libreCaslonText(
            textStyle: TextStyle(
            color: Color(0xFFF73658),
            fontSize: 40.sp,
            fontWeight: FontWeight.w700,
          ),),),
      ],
    ),


    );
  }
}
