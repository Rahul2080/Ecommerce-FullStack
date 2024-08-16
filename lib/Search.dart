import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_exit/double_back_to_exit.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cart.dart';
import 'Home/Productdetails.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchcontroller = TextEditingController();
  final products = FirebaseFirestore.instance.collection("Products").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                    controller: searchcontroller,
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
                    onChanged: (String value){
                      setState(() {


                    });},
                  ),
                ),
              ),SizedBox(height:30.h),

              StreamBuilder<QuerySnapshot>(
                stream: products,
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
                  return SizedBox(width: 500.w,
                    height:600.h,
                    child: ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, position) {
    final searchtext = snapshot.data!
        .docs[position]["productName"]
        .toString();
    if (searchcontroller.text.isEmpty) {
    return SizedBox();
    } else if (searchtext.toLowerCase().contains(
    searchcontroller.text.toLowerCase().toString())) {
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
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.w, top: 5.h),
                                          child: SizedBox(
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
                        );} else { return SizedBox();};
                      },
                      separatorBuilder: (context, position) {
                        return SizedBox(height: 3,);
                      },
                    ),
                  );





                }
                  else {return SizedBox();}}
              ),
            ],
          ),
        ));
  }
}
