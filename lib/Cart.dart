import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home/Productdetails.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body:   SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
        itemCount: 4,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Productdetails()));},
              child: Container(
                width: 170.w,
                height: 130.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160.w,
                          height: 130.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.r),
                              child: Image.asset(
                                "assets/startintroimg.png",
                                fit: BoxFit.cover,
                              )),
                        ),

                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w,top: 5.h),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 162.w,
                                    child: Text(
                                      'Women Printed Kurta',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          height: 0.11.h,
                                        ),
                                      ),
                                    ),
                                  ),  Icon(Icons.clear),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: SizedBox(
                                width: 162.w,
                                child: Text(
                                  'Neque porro quisquam est qui dolorem ipsum quia',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: SizedBox(
                                width: 66.w,
                                height: 15.h,
                                child: Text(
                                  '₹1500',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w,top: 5.h),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 49.w,
                                    height: 16.h,
                                    child: Text(
                                      '₹2499',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Color(0xFFBBBBBB),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 49.w,
                                    height: 16.h,
                                    child: Text(
                                      '40%Off',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          color: Color(0xFFFE735C),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  itemSize: 18.sp,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  itemCount: 5,
                                  itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.w),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  width: 39.w,
                                  height: 14.h,
                                  child: Text(
                                    '56890',
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Color(0xFFA4A9B3),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),


                      ],
                    ),),
              ),
            ),
          );
        },
        separatorBuilder: (context, position) {
          return SizedBox(height: 10.w);
        },
      ),
    ),);
  }
}
