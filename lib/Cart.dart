import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
FirebaseAuth auth=FirebaseAuth.instance;
final addtocart = FirebaseFirestore.instance
    .collection("Users")
    .doc(auth.currentUser!.uid.toString())
    .collection("Carts").snapshots();
final cartdelete=FirebaseFirestore.instance.collection("Users").doc(auth.currentUser!.uid.toString()).collection("Carts");

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: addtocart,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
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
                return Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => Productdetails(
                              image: snapshot.data!.docs[position]["imgUrl"].toString(),
                              productname: snapshot.data!.docs[position]["productName"].toString(),
                              ratting: snapshot.data!.docs[position]["ratting"].toString(),
                              offer: snapshot.data!.docs[position]["offer"].toString(),
                              offerprice: snapshot.data!.docs[position]["offerprice"]
                                  .toString(),
                              price:
                                  snapshot.data!.docs[position]["price"].toString(),
                              about: snapshot.data!.docs[position]["about"].toString(),
                              id:
                              snapshot.data!.docs[position]["id"].toString()
                          ),
                      ));
                    },
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
                                  child: Image.network(
                                    snapshot.data!.docs[position]["imgUrl"].toString(),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w, top: 5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 162.w,
                                        child: Text(
                                          snapshot.data!.docs[position]["productName"].toString(),
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
                                      GestureDetector(onTap: (){ cartdelete
                                          .doc(snapshot
                                          .data!.docs[position]["id"]
                                          .toString())
                                          .delete();},
                                          child: Icon(Icons.clear)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: SizedBox(
                                    width: 162.w,
                                    child: Text(maxLines: 2,
                                      snapshot.data!.docs[position]["about"].toString(),
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
                                      " \₹ ${snapshot.data!
                                          .docs[position]['price']
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
                                  padding: EdgeInsets.only(left: 5.w, top: 5.h),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 49.w,
                                        height: 16.h,
                                        child: Text(
                                          " \₹ ${snapshot.data!
                                              .docs[position]['offerprice']
                                              .toString()}",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                                            '${snapshot.data!
                                                .docs[position]["offer"]
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
                                      initialRating: double.parse(snapshot
                                          .data!.docs[position]["ratting"]
                                          .toString()),
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
                                        snapshot
                                            .data!.docs[position]["ratting"]
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, position) {
                return SizedBox(height: 10.w);
              },
            );
          }else{return SizedBox();}}
        ),
      ),
    );
  }
}
