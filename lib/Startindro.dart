import 'package:ecommerceapp2/Onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Startindro extends StatefulWidget {
  const Startindro({super.key});

  @override
  State<Startindro> createState() => _StartindroState();
}

class _StartindroState extends State<Startindro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Opacity(
        opacity: 1,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/startintroimg.png'),
                  fit: BoxFit.cover)),
          child:  Container(
            width: 390.w,
            height: 362.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00.w, -1.00.h),
                end: Alignment(0.w, 1.h),
                colors: [Colors.black.withOpacity(0.sp), Colors.black.withOpacity(0.6299999952316284)],
              ),
            ),child: SizedBox(
            width: 315.w,
            child: Column(
              children: [
                SizedBox(height: 500.h),
                Text(
                  'You want Authentic, here you go!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.34.w,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: 315.w,
                  child: Text(
                    'Find it here, buy it now!',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Color(0xFFF2F2F2),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.11.h,
                        letterSpacing: 0.14.w,
                      ),
                    ),),
                ),
                SizedBox(height: 20.h),
                GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Onboard()));},
                  child: Container(
                    width: 317.w,
                    height: 55.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF73658),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}
