import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp2/Cart.dart';
import 'package:ecommerceapp2/Home/Purchase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Toastmessage.dart';

class Productdetails extends StatefulWidget {
  final String image;
  final String productname;
  final String ratting;
  final String offer;
  final String offerprice;
  final String price;
  final String about;
  final String id;

  const Productdetails(
      {super.key,
      required this.image,
      required this.productname,
      required this.ratting,
      required this.offer,
      required this.offerprice,
      required this.price,
      required this.about,
      required this.id});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  bool favourite = false;
  int currrentindex = 0;

  Future<void> checkFavourite() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final subcollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("favourite");
    QuerySnapshot querySnapshot = await subcollection.get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]["id"].toString() == widget.id.toString()) {
        setState(() {
          favourite = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("favourite");
    final addtocart = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("Carts");
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Cart()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: CircleAvatar(
                radius: 23.r,
                backgroundColor: Colors.white,
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    child: Image.network(
                      widget.image,
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
                effect:
                    WormEffect(radius: 10.r, dotHeight: 10.h, dotWidth: 10.w),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      widget.productname,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 90.w),
                  Container(
                    width: 50.w,
                    height: 50.h,
                    child: IconButton(
                      icon: favourite == true
                          ? Icon(
                              Icons.favorite,
                              size: 30.sp,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                              size: 30.sp,
                            ),
                      onPressed: () {
                        checkFavourite();
                        if (favourite == true) {
                          firestore.doc(widget.id).delete().then((onValue) {
                            Fluttertoast.showToast(msg: "removed");
                            setState(() {
                              favourite = false;
                            });
                          });
                        } else {
                          firestore.doc(widget.id).set({
                            "imgUrl": widget.image,
                            "id": widget.id,
                            "ratting": widget.ratting,
                            "price": widget.price,
                            "productName": widget.productname,
                            "about": widget.about,
                            "offerprice": widget.offerprice,
                            "offer": widget.offer
                          }).then((onValue) {
                            Fluttertoast.showToast(msg: "added to Favourates");
                            setState(() {
                              favourite = true;
                            });
                          }).onError((error, stackTrace) => ToastMessage()
                              .toastmessage(message: error.toString()));
                        }
                        ;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  RatingBar.builder(
                    itemSize: 18.sp,
                    initialRating: double.parse(widget.ratting),
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
                      widget.ratting.toString(),
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
                      widget.offerprice,
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
                      '\₹${widget.price}',
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
                      '${widget.offer} \%Off',
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
              padding: EdgeInsets.only(left: 10.w, top: 20.h),
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
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
              child: ReadMoreText(
                widget.about.toString(),
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 70.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  addtocart.doc(widget.id).set({
                    "imgUrl": widget.image,
                    "id": widget.id,
                    "ratting": widget.ratting,
                    "price": widget.price,
                    "productName": widget.productname,
                    "about": widget.about,
                    "offerprice": widget.offerprice,
                    "offer": widget.offer
                  }).then((onValue) {
                    Fluttertoast.showToast(msg: "added to Cart");
                  }).onError((error, stackTrace) =>
                      ToastMessage().toastmessage(message: error.toString()));
                },
                child: Container(
                  width: 300.w,
                  height: 60.h,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00.w, -1.00.h),
                      end: Alignment(0.w, 1.h),
                      colors: [Color(0xFF3E92FF), Color(0xFF0B3689)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Purchase(
                      image: widget.image,
                      productname: widget.productname,
                      price: widget.price,
                      about: widget.about,
                      id: widget.id,
                      offerprice: widget.offerprice,
                      ratting: widget.ratting,
                      offer: widget.offer,
                    ),
                  ),
                );
              },
              child: Center(
                child: Container(
                  width: 300.w,
                  height: 60.h,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00.w, -1.00.h),
                      end: Alignment(0.w, 1.h),
                      colors: [Color(0xFF3E92FF), Color(0xFF0B3689)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
