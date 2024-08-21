import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp2/Home/Productdetails.dart';
import 'package:ecommerceapp2/Profile_pages/Order_track.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Myorder extends StatefulWidget {
  const Myorder({super.key});

  @override
  State<Myorder> createState() => _MyorderState();
}

FirebaseAuth auth = FirebaseAuth.instance;
final orders = FirebaseFirestore.instance
    .collection("Users")
    .doc(auth.currentUser!.uid.toString())
    .collection("orders")
    .snapshots();

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 720.h,
            child: StreamBuilder<QuerySnapshot>(
                stream: orders,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "ERROR",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, position) {
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => OrderTrack(status: snapshot.data!
                                      .docs[position]["status"]
                                      .toString()
                                  )));
                            },
                            child: Container(
                              width: 331.w,
                              height: 171.h,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r)),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 14.r,
                                    offset: Offset(0.w, 6.h),
                                    spreadRadius: -8.r,
                                  ),
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 9.r,
                                    offset: Offset(0.w, -4.h),
                                    spreadRadius: -7.r,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (_) => Productdetails(
                                                  image: snapshot.data!
                                                      .docs[position]["imgUrl"]
                                                      .toString(),
                                                  productname: snapshot
                                                      .data!
                                                      .docs[position]
                                                          ["productName"]
                                                      .toString(),
                                                  ratting: snapshot.data!
                                                      .docs[position]["ratting"]
                                                      .toString(),
                                                  offer: snapshot.data!
                                                      .docs[position]["offer"]
                                                      .toString(),
                                                  offerprice:
                                                      snapshot.data!.docs[position]["offerprice"].toString(),
                                                  price: snapshot.data!.docs[position]['price'].toString(),
                                                  about: snapshot.data!.docs[position]["about"].toString(),
                                                  id: snapshot.data!.docs[position]["id"].toString())));
                                        },
                                        child: Container(
                                          width: 128.14.w,
                                          height: 125.93.h,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            child: Image.network(
                                              snapshot.data!
                                                  .docs[position]["imgUrl"]
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 188.w,
                                            height: 23.h,
                                            child: Text(
                                              snapshot.data!
                                                  .docs[position]["productName"]
                                                  .toString(),
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                                  ' 10 May 2XXX',
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: -1.10.w,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 28.w,
                                                height: 16.h,
                                                child: Text(
                                                  snapshot.data!
                                                      .docs[position]["ratting"]
                                                      .toString(),
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              RatingBar.builder(
                                                itemSize: 18.sp,
                                                initialRating: double.parse(
                                                    snapshot
                                                        .data!
                                                        .docs[position]
                                                            ["ratting"]
                                                        .toString()),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                ignoreGestures: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 1.w),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Row(
                                            children: [
                                              Container(
                                                width: 84.w,
                                                height: 29.h,
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 0.30.w,
                                                        color:
                                                            Color(0xFFCACACA)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  width: 64.w,
                                                  height: 12.h,
                                                  child: Text(
                                                    " \₹ ${snapshot.data!.docs[position]['price'].toString()}",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    width: 53.w,
                                                    height: 12.h,
                                                    child: Text(
                                                      '${snapshot.data!.docs[position]["offer"].toString()} \%Off',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle: TextStyle(
                                                          color:
                                                              Color(0xFFEA3030),
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    " \₹ ${snapshot.data!.docs[position]['offerprice'].toString()}",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                        color:
                                                            Color(0xFFA6A6A6),
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 150.w,
                                          height: 20.h,
                                          child: Text(
                                            'Total Order (1)   :  ',
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
                                          width: 60.w,
                                        ),
                                        Container(
                                          width: 100.w,
                                          height: 20.h,
                                          child: Text(
                                            " \₹ ${snapshot.data!.docs[position]['price'].toString()}",
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return SizedBox(height: 10.h);
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
