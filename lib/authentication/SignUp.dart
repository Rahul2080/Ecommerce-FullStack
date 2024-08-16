import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp2/Bottomnavigation.dart';
import 'package:ecommerceapp2/authentication/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/Home.dart';
import '../Toastmessage.dart';
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
TextEditingController namecontroller=TextEditingController();
  bool passwordvisible = true;
  bool confirmpasswordvisible = true;
  var formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Form(key: formkey,
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


              Padding(
                padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
                child: Center(
                  child: TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
                      hintText: 'Enter Your Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
                      hintText: 'Username or Email',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),validator: (emailvalue){
                    if (emailvalue!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailvalue)) {
                      return 'Enter a valid email!';
                    }
                    return null;

                  },
                  ),
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
                child: Center(
                  child: TextFormField(
                    obscureText: passwordvisible,
                    controller: passwordcontroller,
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
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
                        )),validator: (passwordvalue) {
                    if (passwordvalue!.isEmpty || passwordvalue.length < 6) {
                      return 'Enter a valid password!';
                    }

                    return null;
                  },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
                  child: TextFormField(
                    obscureText: confirmpasswordvisible,
                    controller: confirmpasswordcontroller,
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
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
                    ), validator: (value) {
                    if (value!.isEmpty ||
                        passwordcontroller.text != confirmpasswordcontroller.text) {
                      return 'Enter a valid password!';
                    }

                    return null;
                  }
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
              SizedBox(height: 20.h),
              Center(
                child: GestureDetector(onTap: (){
                  final isValid = formkey.currentState?.validate();
                  if (isValid!) {
                    auth
                        .createUserWithEmailAndPassword(
                        email: emailcontroller.text, password: passwordcontroller.text)
                        .then((onValue) {
                      firestore.doc(auth.currentUser!.uid.toString()).set({
                        "name": namecontroller.text,
                        "id": auth.currentUser!.uid.toString(),
                        "email": emailcontroller.text,
                        "password": passwordcontroller.text,
                        "profile": "",
                      });
                     // checkLogin();
                      Fluttertoast.showToast(msg: "Succesfully Login");
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Bottomnavigation()),
                              (route) => false);
                    }).onError((error, stackTrace) => ToastMessage()
                        .toastmessage(message: error.toString()));
                  }
                  formkey.currentState?.save();


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
                          GestureDetector(onTap: (){signInwithGoogle();},
                            child: Container(
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
      ),
    );
  }
  Future<String?> signInwithGoogle() async {
     checkLogin();
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential).then((onValue) async {
        await firestore.doc(auth.currentUser!.uid.toString()).set({
          "name": auth.currentUser!.displayName.toString(),
          "id": auth.currentUser!.uid.toString(),
          "email": auth.currentUser!.email.toString(),
          "password": passwordcontroller.text,
          "profile": auth.currentUser!.photoURL.toString(),
        });
        Fluttertoast.showToast(msg: "Succesfully login");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Bottomnavigation()),
                (route) => false);

      }).onError((error, stackTrace) =>
          ToastMessage().toastmessage(message: error.toString()));

    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
  void checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Token', true);
  }
}
