import 'package:double_back_to_exit/double_back_to_exit.dart';
import 'package:ecommerceapp2/Profile_pages/AboutUs.dart';
import 'package:ecommerceapp2/Profile_pages/Myorder.dart';
import 'package:ecommerceapp2/authentication/Login.dart';
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
              ),child: Icon(Icons.camera_alt,color: Colors.white,),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding:  EdgeInsets.only(left: 25.w),
      child: Container(width: 330.w,height: 90.h,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 20.w),
                Text(
                  'Name..........',
                  style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),),SizedBox(width: 160.w),
                Icon(Icons.edit,color: Colors.black,),

              ],
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
      ),
    ),

    SizedBox(height: 40.h),
    Center(
      child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Myorder()));},
        child: Container(
          width: 340.w,
          height: 50.h,
          decoration: ShapeDecoration(
            color: Color(0xFFC6D6D3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r)),
          ),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20.w),
                child: Container(height: 50.h,width: 100.w,
                  child: Center(
                    child: Text(
                      'My Order ',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 170.w),
              Container(width: 50.w,height: 50.h,
                  child: Icon(Icons.double_arrow))
            ],
          ),
        ),
      ),
    ),
    SizedBox(height: 40.h),
    Center(
      child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Aboutus()));},
        child: Container(
          width: 340.w,
          height: 50.h,
          decoration: ShapeDecoration(
            color: Color(0xFFC6D6D3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r)),
          ),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20.w),
                child: Container(height: 50.h,width: 100.w,
                  child: Center(
                    child: Text(
                      'About Us ',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 170.w),
              Container(width: 50.w,height: 50.h,
                  child: Icon(Icons.double_arrow))
            ],
          ),
        ),
      ),
    ),

    SizedBox(height: 40.h),
    Center(
      child: GestureDetector(onTap: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Login()), (route)=>(false));},
        child: Container(
          width: 340.w,
          height: 50.h,
          decoration: ShapeDecoration(
            color: Color(0xFFC6D6D3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r)),
          ),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20.w),
                child: Container(height: 50.h,width: 100.w,
                  child: Center(
                    child: Text(
                      'Logout ',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 170.w),
              Container(width: 50.w,height: 50.h,
                  child: Icon(Icons.double_arrow))
            ],
          ),
        ),
      ),
    ),

      ],
    ),
    );
  }
}
