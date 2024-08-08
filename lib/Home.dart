import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currrentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Center(
              child: Container(
                width: 343.w,
                height: 40.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10.r,
                      offset: Offset(2.w, 2.h),
                      spreadRadius: 10.r,
                    )
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search any Product..',
                      hintStyle: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.10.h,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              height: 36.sp,
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  Text(
                    'All Featured',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 0.07.h,
                      ),
                    ),
                  ),
                  SizedBox(width: 60.w),
                  Container(
                    width: 80.w,
                    height: 28.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 16.r,
                          offset: Offset(1.w, 1.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sort',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.11.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.swap_vert)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 80.w,
                    height: 28.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 16.r,
                          offset: Offset(1.w, 1.h),
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Filter',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.11.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.filter_alt_outlined)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 100.h,
              width: double.infinity,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: CircleAvatar(
                          radius: 36.r,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        width: 56.w,
                        height: 11.h,
                        child: Text(
                          'Fashion',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xFF21003D),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              height: 0.16.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, position) {
                  return SizedBox(
                    width: 5.w,
                  );
                },
              ),
            ),
            CarouselSlider.builder(
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
            SizedBox(height: 10.h),
            AnimatedSmoothIndicator(
              activeIndex: currrentindex,
              count: 3,
              effect: WormEffect(radius: 10.r, dotHeight: 10.h, dotWidth: 10.w),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 343.w,
              height: 60.h,
              decoration: ShapeDecoration(
                color: Color(0xFF4392F8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ), child: Padding(
                padding:  EdgeInsets.only(left: 10.w,top: 10.h),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                    'Deal of the Day',
                    style:GoogleFonts.montserrat(
                      textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: 0.08.h,
                    ),),
                              ),
                    Padding(
                      padding:  EdgeInsets.only(left: 230.w,),
                      child: Container(
                        width: 89.w,
                        height: 28.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.w, color: Colors.white),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'View all',
                                textAlign: TextAlign.center,
                                style:GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,

                                  fontWeight: FontWeight.w600,
                                  height: 0.11.h,
                                ),
                              ),),
                              Icon(Icons.arrow_forward,color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Icon(Icons.alarm,size: 17.sp,color: Colors.white,),SizedBox(width: 5.w),
                        Text(
                          '22h 55m 20s remaining ',
                          style:GoogleFonts.montserrat(
                            textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 0.11.h,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),SizedBox(height: 10.h),

            SizedBox(width: double.infinity, height: 241.h ,
              child: ListView.separated(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return Container(
                    width: 170.w,
                    height: 241.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                    ),child: Container(child: Column(
                      children: [
                        SizedBox( width: 170.w,
                            height: 124.h,
                            child: Image.asset("assets/startintroimg.png",fit: BoxFit.cover,),),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: 162.w,
                          child: Text(
                            'Women Printed Kurta',
                            style:GoogleFonts.montserrat(
                              textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.11.h,
                            ),),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: 162.w,
                          child: Text(
                            'Neque porro quisquam est qui dolorem ipsum quia',
                            style:GoogleFonts.montserrat(
                              textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: 66.w,
                          height: 15.h,
                          child: Text(
                            '₹1500',
                            style:GoogleFonts.montserrat(
                              textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.11.h,
                            ),
                          ),),
                        ),
                      SizedBox(
                        width: 49.w,
                        height: 16.h,
                        child: Text(
                          '₹2499',
                          style:GoogleFonts.montserrat(
                  textStyle: TextStyle(decoration: TextDecoration.lineThrough,
                            color: Color(0xFFBBBBBB),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                          ),
                        ),),

                      ],
                    )),
                  );
                },
                separatorBuilder: (context, position) {
                  return SizedBox(width: 10.w);
                },

              ),
            ),

          ],
        ),
      ),
    );
  }
}
