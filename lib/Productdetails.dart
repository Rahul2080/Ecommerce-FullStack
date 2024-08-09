import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp2/Purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int currrentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CircleAvatar(
              radius: 23.r,
              backgroundColor: Colors.white,
              child: Icon(Icons.shopping_cart_outlined),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CarouselSlider.builder(
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                width: 343.w,
                height: 189.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    "assets/sliderimg.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  initialPage: 2,
                  height: 200.h,
                  onPageChanged: (index, r) {
                    setState(() {
                      currrentindex = index;
                    });
                  }),
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: currrentindex,
              count: 3,
              effect: WormEffect(radius: 10.r, dotHeight: 10.h, dotWidth: 10.w),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: SizedBox(
              width: 200.w,
              child: Text(
                'NIke Sneakers',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                RatingBar.builder(
                  itemSize: 18.sp,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  width: 10.w,
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
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
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
                  width: 55.w,
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
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: SizedBox(
              width: 126.w,
              child: Text(
                'Product Details',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,right: 10.w),
            child: ReadMoreText(
              'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the',
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),


SizedBox(height: 20.h),

          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 136.w,
                  height: 40.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 2.h,
                        child: Container(
                          width: 136.w,
                          height: 36.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.00.w, -1.00.h),
                              end: Alignment(0.w, 1.h),
                              colors: [Color(0xFF3E92FF), Color(0xFF0B3689)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(4.r),
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(4.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40.w,
                        top: 18.h,
                        child: Text(
                          'Go to cart',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 0.08.h,
                          ),),
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-0.00.w, -1.00.h),
                            end: Alignment(0.w, 1.h),
                            colors: [Color(0xFF3E92FF), Color(0xFF0B3689)],
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                      Positioned(
                        left: 8.w,
                        top: 8.h,
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Purchase()));},
                  child: Container(
                    width: 137.w,
                    height: 40.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 1.w,
                          top: 2.h,
                          child: Container(
                            width: 136.w,
                            height: 36.h,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00.w, -1.00.h),
                                end: Alignment(0.w, 1.h),
                                colors: [Color(0xFF70F8A8), Color(0xFF31B669)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(4.r),
                                  bottomLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 49.w,
                          top: 18.h,
                          child: Text(
                            'Buy Now',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.08.h,
                            ),),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00.w, -1.00.h),
                              end: Alignment(0.w, 1.h),
                              colors: [Color(0xFF70F8A8), Color(0xFF31B669)],
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        Positioned(
                          left: 8.w,
                          top: 8.h,
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                  child: Icon(Icons.touch_app_outlined,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
