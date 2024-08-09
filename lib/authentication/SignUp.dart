import 'package:ecommerceapp2/Bottomnavigation.dart';
import 'package:ecommerceapp2/authentication/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home.dart';
import 'Phone.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool passwordvisible = true;
  bool confirmpasswordvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: SizedBox(
                width: 185.w,
                height: 90.h,
                child: Text(
                  'Create an \naccount',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Center(
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Username or Email',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: TextField(
                  obscureText: passwordvisible,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            passwordvisible = !passwordvisible;
                          });
                        },
                      )),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: TextField(
                  obscureText: confirmpasswordvisible,
                  controller: confirmpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          confirmpasswordvisible = !confirmpasswordvisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: SizedBox(
                width: 258.w,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By clicking the ',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'Register',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFFFF4B26),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' button, you agree to the public offer',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Center(
              child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Bottomnavigation()));},
                child: Container(
                  width: 317.w,
                  height: 55.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF73658),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r)),
                  ),child: Center(
                    child: Text(
                    'Create Account',
                    style:GoogleFonts.montserrat(
                      textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),),
                                  ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: Container(width: 228.w,height: 160.h,
                child: Column(
                  children: [
                    Text(
                      '- OR Continue with -',
                      textAlign: TextAlign.center,
                      style:GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color(0xFF575757),
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        SizedBox(width: 55.w),
                        Container(
                          width: 54.w,
                          height: 54.h,
                          padding:  EdgeInsets.all(15.sp),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFBF3F5),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: Color(0xFFF73658)),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),child: Image.asset("assets/google.png"),
                        ),
                        SizedBox(width: 14.w),
                        GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Phone()));},
                          child: Container(
                            width: 54.w,
                            height: 54.h,

                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFBF3F5),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.w, color: Color(0xFFF73658)),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                            ),child:Icon(Icons.phone,size: 30.sp,),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 30.h),

                    Row(
                      children: [
                        Text(
                          'I Already Have an Account',
                          textAlign: TextAlign.center,
                          style:GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xFF575757),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),),
                        SizedBox(width: 5.w),
                        GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));},
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style:GoogleFonts.montserrat(
                              textStyle: TextStyle(decoration: TextDecoration.underline,
                                color: Color(0xFFF73658),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
