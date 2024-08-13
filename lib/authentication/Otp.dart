import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bottomnavigation.dart';
import '../Toastmessage.dart';
import 'Login.dart';

class Otp extends StatefulWidget {
  final String verification;
  final String name;
  final String email;
  const Otp({super.key, required this.verification, required this.name, required this.email});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 255.w,
            height: 90.h,
            child: Text(
              'Verification Code',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 31.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) async {
              final credentials = PhoneAuthProvider.credential(
                  verificationId: widget.verification,
                  smsCode: verificationCode);
              // checkLogin();
              try {
                await auth.signInWithCredential(credentials).then((onValue) {
                  firestore.doc(auth.currentUser!.uid.toString()).set({
                    "name": widget.name.toString(),
                    "id": auth.currentUser!.uid.toString(),
                    "email": widget.email.toString(),
                    "password": "",
                    "profile": "",
                    "premium": false
                  });
                  Navigator.of(context)
                      .pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => Bottomnavigation()),
                          (route) => (false))
                      .onError((error, stackTrace) => ToastMessage()
                          .toastmessage(message: error.toString()));
                });
              } catch (e) {
                Fluttertoast.showToast(msg: "Error");
              }
              ;
            }, // end onSubmit
          ),
          Text(
            'We texted you a code.Please \nenter it below',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
