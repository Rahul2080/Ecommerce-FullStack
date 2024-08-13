import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Toastmessage.dart';
import 'Login.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: SizedBox(
                  width: 185.w,
                  height: 90.h,
                  child: Text(
                    'Forgot\npassword?',
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
                height: 100.h,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter your email address',
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 10.h),
                child: SizedBox(
                  width: 282.w,
                  height: 48.h,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '*',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xFFFF4B26),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextSpan(
                          text:
                              ' We will send you a message to set or reset your new password',
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
                child: GestureDetector(
                  onTap: () {
                    final isValid = formkey.currentState?.validate();
                    if (isValid!) {
                      auth
                          .sendPasswordResetEmail(email: emailcontroller.text)
                          .then((onValue) {
                        ToastMessage().toastmessage(
                            message: "Reset link sent to your email");
                        Navigator.pop(context);
                      }).onError((error, StackTrace) {
                        ToastMessage().toastmessage(message: error.toString());
                      });
                    }
                  },
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
                        'Submit',
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
            ],
          ),
        ),
      ),
    );
  }
}
