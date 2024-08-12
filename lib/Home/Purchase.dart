import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Purchase extends StatefulWidget {
  const Purchase({super.key});

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Bag',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 0.09.h,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Icon(
              Icons.favorite_border,
              size: 30.sp,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Container(
              width: 426.w,
              height: 153.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 123.w,
                    height: 153.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.asset(
                          "assets/startintroimg.png",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: SizedBox(
                          width: 188.w,
                          height: 23.h,
                          child: Text(
                            'Women’s Casual Wear',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 188.w,
                        height: 40.h,
                        child: Text(
                          'Checked Single-Breasted Blazer',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            'Delivery by ',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 110.w,
                            height: 20.h,
                            child: Text(
                              '10 May 2XXX',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.10.w,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 20.h),
            child: Row(
              children: [
                Text(
                  'Apply Coupons',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.70.w,
                    ),
                  ),
                ),
                SizedBox(width: 180.w),
                Text(
                  'Select',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.70.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: Text(
              'Order Payment Details',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.70.w,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 20.h),
            child: Row(
              children: [
                Text(
                  'Order Amounts',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.70.w,
                    ),
                  ),
                ),SizedBox(width: 140.w),
                Text(
                  ' 7,000.00',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 10.h),
            child: Row(
              children: [
                Text(
                  'Convenience',
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.70.w,
                  ),),
                ),SizedBox(width: 20.w),
                Text(
                  'Know More',
                  style:GoogleFonts.montserrat(
                textStyle:  TextStyle(
                    color: Color(0xFFF73658),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),),
                ),SizedBox(width: 50.w),
                Text(
                  'Apply Coupon',
                  textAlign: TextAlign.right,
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Color(0xFFE91611),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 10.h),
            child: Row(
              children: [
                Text(
                    'Delivery Fee',
                    style:GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.70.w,
                      ),
                    )),SizedBox(width:230.w ),


            Text(
              'Free',
              textAlign: TextAlign.right,
              style:GoogleFonts.montserrat(
                textStyle: TextStyle(
                color: Color(0xFFF73658),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),),),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
            child: Divider(),
          ),

          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 20.h),
            child: Row(
              children: [
                Text(
                  'Order Total',
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.70.w,
                  ),
                ),),
                SizedBox(width: 170.w,),
                Text(
                  '7,000.00',
                  textAlign: TextAlign.right,
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 20.h),
            child: Row(
              children: [
                Text(
                  'EMI  Available ',
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.70.w,
                  ),),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Details',
                  textAlign: TextAlign.right,
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Color(0xFFF73658),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),),
              ],
            ),
          ),
          SizedBox(height: 80.h),
          Center(
            child: Container(
              width: 219.w,
              height: 48.h,
              decoration: ShapeDecoration(
                color: Color(0xFFF73658),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
              ),child: Center(
                child: Text(
                'Proceed to Payment',
                textAlign: TextAlign.center,
                style:GoogleFonts.montserrat(
                  textStyle:  TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41.w,
                ),
                            ), ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
