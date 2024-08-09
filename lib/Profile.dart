import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Center(
        child: Text(
          'Checkout',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
body: Column(crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Center(
      child: Stack(
        children: [
          Container(
            width: 96.w,
            height: 96.h,
            decoration: ShapeDecoration(color: Colors.blue,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),child: Image.asset("assets/offerimg.png"),
          ),
          Padding(

            padding:  EdgeInsets.only(left: 70.w,top: 60.h),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: ShapeDecoration(
                color: Color(0xFF4392F9),
                shape: OvalBorder(
                  side: BorderSide(width: 3.w, color: Colors.white),
                ),
              ),child: Icon(Icons.edit,color: Colors.white,),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding:  EdgeInsets.only(left: 25.w),
      child: Text(
        'Name..........',
        style: GoogleFonts.montserrat(
      textStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),),
    ),
    Padding(
      padding:  EdgeInsets.only(left: 25.w),
      child: Text(
        'Email Address',
        style: GoogleFonts.montserrat(
      textStyle: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),),
      ),
    ),
  ],
),
    );
  }
}
