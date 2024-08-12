import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Center(
        child: Container(
          width: 150.w,
          height: 45.h,
          child: Row(
            children: [
              SizedBox(
                  width: 38.78.w,
                  height: 31.03.h,
                  child: Image.asset("assets/splashphoto.png")),
              SizedBox(width: 6.w),
              Text(
                'Stylish',
                textAlign: TextAlign.center,
                style: GoogleFonts.libreCaslonText(
                  textStyle: TextStyle(
                    color: Color(0xFF4392F9),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    height: 0.07.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      leading: Icon(
        Icons.menu,
        size: 30.sp,
      ),
      actions: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: ShapeDecoration(
            color: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          child: Icon(Icons.person),
        )
      ],
    ),
      body: DynamicHeightGridView(
          itemCount: 10,
          crossAxisCount: 2,
          builder: (ctx, index) {
            return Padding(
              padding:  EdgeInsets.only(left: 10.w,right: 10.w),
              child: Container(
                width: 170.w,
                height: 241.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 183.w,
                          height: 124.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.r),
                              child: Image.asset(
                                "assets/startintroimg.png",
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: SizedBox(
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
                          ),
                        ),
                        SizedBox(height: 10.h),
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
                    )),
              ),
            );
          }),
    );
  }
}
