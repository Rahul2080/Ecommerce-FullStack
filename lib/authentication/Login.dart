import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp2/authentication/ForgetPassword.dart';
import 'package:ecommerceapp2/Home/Home.dart';
import 'package:ecommerceapp2/authentication/Phone.dart';
import 'package:ecommerceapp2/authentication/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Bottomnavigation.dart';
import '../Toastmessage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
TextEditingController emailcontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();
TextEditingController namecontroller=TextEditingController();
FirebaseAuth auth =FirebaseAuth.instance;
final  firestore =FirebaseFirestore.instance.collection("Users");
final GoogleSignIn googleSignIn = GoogleSignIn();

bool passwordvisible=true;
class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
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

              Padding(
                padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
                child: Center(
                  child: TextFormField(controller: emailcontroller,
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
                padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
                child: Center(
                  child: TextFormField(obscureText: passwordvisible,
                    controller: passwordcontroller,
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
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
                    ),validator: (passwordvalue) {
                      if (passwordvalue!.isEmpty || passwordvalue.length < 6) {
                        return 'Enter a valid password!';
                      }

                      return null;
                    },
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
                height: 40.h,
              ),
              Center(
                child: GestureDetector(onTap: (){
                  final isValid = formkey.currentState?.validate();
                  if (isValid!) {
                    auth
                        .signInWithEmailAndPassword(
                        email: emailcontroller.text, password: passwordcontroller.text)
                        .then((onValue) {
                      // checkLogin();
                      Fluttertoast.showToast(msg: "Succesfully Login");
                      emailcontroller.clear();
                      passwordcontroller.clear();
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
                      GestureDetector(onTap: (){signInwithGoogle(); },
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
      ),
    );
  }
  Future<String?> signInwithGoogle() async {
   // checkLogin();
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

}
