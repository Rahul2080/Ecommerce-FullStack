import 'package:ecommerceapp2/authentication/Otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bottomnavigation.dart';
import 'Login.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonenumbercontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false
        ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: SizedBox(
              width: 250.w,
              height: 90.h,
              child: Text(
                'Enter Your \nPhone Number',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 28.sp,
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
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.mail),
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
              child: TextField(controller: phonenumbercontroller,keyboardType: TextInputType.number,
                decoration: InputDecoration(prefix: Text("+91 "),
                  hintText: 'Enter Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),

                  )
                ),
              ),
            ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: SizedBox(
              width: 258.w,
              child: Text(
                 'We will send a one-time password (OTP) to your phone number for verification ',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Center(
            child: GestureDetector(onTap: (){
              auth.verifyPhoneNumber(

                  phoneNumber:"+91${phonenumbercontroller.text}",
                  verificationCompleted: (_){},
                  verificationFailed: (error){ Fluttertoast.showToast(
                      msg: error.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0.sp);},
                  codeSent: (String verificationId,int? token){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Otp(verification: verificationId, name: namecontroller.text, email:emailcontroller.text,)));
                  },
                  codeAutoRetrievalTimeout: (error){ Fluttertoast.showToast(
                      msg: error.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0.sp);});



        },
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF73658),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                ),child: Center(
                child: Text(
                  'Send OTP ',
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

        ],
            ),
      ),

    );
  }
}
