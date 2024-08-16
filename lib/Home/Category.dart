import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Productdetails.dart';

class Category extends StatefulWidget {
  final List<dynamic>product;

  const Category({super.key, required this.product});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DynamicHeightGridView(
        itemCount: widget.product.length,
        crossAxisCount: 2,
        builder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: GestureDetector(onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                  Productdetails(image:  widget.product[index]["imgUrl"].toString(),
                      productname:  widget.product[index]["productName"].toString(),
                      ratting:  widget.product[index]["ratting"].toString(),
                      offer:  widget.product[index]["offer"].toString(),
                      offerprice:  widget.product[index]["offerprice"].toString(),
                      price:  widget.product[index]["price"].toString(),
                      about:  widget.product[index]["about"].toString(),
                      id:  widget.product[index]["id"].toString()
                  )));
            },
              child: Container(
                width: 170.w,
                height: 241.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),),
                ),
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 183.w,
                          height: 124.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  6.r),
                              child: Image.network(
                                widget.product[index]["imgUrl"].toString(),
                                fit: BoxFit.cover,
                              ),),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: SizedBox(
                            width: 162.w,
                            child: Text(
                              widget.product[index]["productName"].toString(),
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
                            child: Text(maxLines: 2,
                              widget.product[index]["about"].toString(),
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
                              " \₹ ${widget.product[index]['price']
                                  .toString()}",
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
                          padding: EdgeInsets.only(
                              left: 5.w, top: 5.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 49.w,
                                height: 16.h,
                                child: Text(
                                  " \₹ ${widget.product[index]['offerprice']
                                      .toString()}",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      decoration: TextDecoration
                                          .lineThrough,
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
                                  '${widget.product[index]["offer"]
                                      .toString()} \%Off',
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
                              initialRating: double.parse(
                                  widget.product[index]["ratting"]
                                      .toString()),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              itemCount: 5,
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 1.w),
                              itemBuilder: (context, _) =>
                                  Icon(
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
                                widget.product[index]["ratting"]
                                    .toString(),
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
            ),
          );
        }),);
  }
}
