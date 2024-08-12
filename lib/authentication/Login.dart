import 'package:ecommerceapp2/authentication/ForgetPassword.dart';
import 'package:ecommerceapp2/Home/Home.dart';
import 'package:ecommerceapp2/authentication/Phone.dart';
import 'package:ecommerceapp2/authentication/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bottomnavigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
TextEditingController emailcontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();
TextEditingController namecontroller=TextEditingController();

bool passwordvisible=true;
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 25.w),
              child: SizedBox(
                width: 185.w,
                height: 90.h,
                child: Text(
                  'Welcome\nBack!\n',
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
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ),  SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: TextField(controller: emailcontroller,
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
                child: TextField(obscureText: passwordvisible,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),suffixIcon:IconButton(icon: Icon(Icons.visibility),
                    onPressed: () {

                      setState(() {
                        passwordvisible=!passwordvisible;
                      });

                    },)
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 220.w, top: 5.h),
              child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Forgetpassword()));},
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Bottomnavigation()));},
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
                      'Login',
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
            ),
            SizedBox(height: 30.h),
            Center(
              child: Container(width: 194.w,height: 160.h,
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
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(width: 35.w),
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
                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        Text(
                          'Create An Account',
                          textAlign: TextAlign.center,
                          style:GoogleFonts.montserrat(
                            textStyle: TextStyle(
                            color: Color(0xFF575757),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),),
                        SizedBox(width: 5.w),
                        GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Signup()));},
                          child: Text(
                            'Sign Up',
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
