

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'Home/Productdetails.dart';
import 'Toastmessage.dart';

class Cart extends StatefulWidget {


  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

FirebaseAuth auth = FirebaseAuth.instance;
final addtocart = FirebaseFirestore.instance
    .collection("Users")
    .doc(auth.currentUser!.uid.toString())
    .collection("Carts")
    .snapshots();
final cartdelete = FirebaseFirestore.instance
    .collection("Users")
    .doc(auth.currentUser!.uid.toString())
    .collection("Carts");

class _CartState extends State<Cart> {


  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response)async {

    final updateorder = FirebaseFirestore.instance
        .collection("Users").doc(auth.currentUser!.uid.toString())
        .collection("orders");
    final addtocart = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("Carts");

    QuerySnapshot querySnapshot =await addtocart.get();
    for( int i=0; i<querySnapshot.docs.length; i++){
      updateorder.doc(querySnapshot.docs[i]["id"].toString()).set({
        "imgUrl":querySnapshot.docs[i]["imgUrl"].toString(),
        "id": querySnapshot.docs[i]["id"].toString(),
        "ratting": querySnapshot.docs[i]["ratting"].toString(),
        "price":querySnapshot.docs[i]["price"].toString(),
        "productName":querySnapshot.docs[i]["productName"].toString(),
        "about": querySnapshot.docs[i]["about"].toString(),
        "offerprice": querySnapshot.docs[i]["offerprice"].toString(),
        "offer":querySnapshot.docs[i]["offer"].toString(),
        "status": "order placed",

      }).then((onValue) {
        Fluttertoast.showToast(msg: "Order succesfully");
      }).onError((error, stackTrace) =>
          ToastMessage().toastmessage(message: error.toString()));
    }

    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: StreamBuilder<QuerySnapshot>(
          stream: addtocart,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              dynamic sum = 0;
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                sum = sum +
                    double.parse(snapshot.data!.docs[i]["price"].toString());
              }

              return Container(
                width: double.infinity.w,
                height: 75.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 112.w,
                        child: Column(
                          children: [
                            Text(
                              "Total Price",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              "\₹ ${sum.toString()}",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Razorpay razorpay = Razorpay();
                          var options = {
                            'key': 'rzp_test_gKANZdsNdLqaQs',
                            'amount': 100,
                            'name': 'Acme Corp.',
                            'description': 'Fine T-Shirt',
                            'retry': {'enabled': true, 'max_count': 1},
                            'send_sms_hash': true,
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            },
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                              handlePaymentErrorResponse);
                          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                              handlePaymentSuccessResponse);
                          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                              handleExternalWalletSelected);
                          razorpay.open(options);
                        },
                        child: Container(
                          width: 219.w,
                          height: 48.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF73658),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r)),
                          ),
                          child: Center(
                            child: Text(
                              'Proceed to Payment',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.41.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          }),
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
            stream: addtocart,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                dynamic sum = 0;
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  sum = sum +
                      double.parse(snapshot.data!.docs[i]["price"].toString());
                }

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
                                image: snapshot.data!.docs[position]["imgUrl"]
                                    .toString(),
                                productname: snapshot
                                    .data!.docs[position]["productName"]
                                    .toString(),
                                ratting: snapshot
                                    .data!.docs[position]["ratting"]
                                    .toString(),
                                offer: snapshot.data!.docs[position]["offer"]
                                    .toString(),
                                offerprice: snapshot
                                    .data!.docs[position]["offerprice"]
                                    .toString(),
                                price: snapshot.data!.docs[position]["price"]
                                    .toString(),
                                about: snapshot.data!.docs[position]["about"]
                                    .toString(),
                                id: snapshot.data!.docs[position]["id"]
                                    .toString()),
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
                                        snapshot.data!.docs[position]["imgUrl"]
                                            .toString(),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 5.w, top: 5.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 162.w,
                                            child: Text(
                                              snapshot.data!
                                                  .docs[position]["productName"]
                                                  .toString(),
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
                                          GestureDetector(
                                              onTap: () {
                                                cartdelete
                                                    .doc(snapshot.data!
                                                        .docs[position]["id"]
                                                        .toString())
                                                    .delete();
                                              },
                                              child: Icon(Icons.clear)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: SizedBox(
                                        width: 162.w,
                                        child: Text(
                                          maxLines: 2,
                                          snapshot.data!.docs[position]["about"]
                                              .toString(),
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
                                          " \₹ ${snapshot.data!.docs[position]['price'].toString()}",
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
                                      padding:
                                          EdgeInsets.only(left: 5.w, top: 5.h),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 49.w,
                                            height: 16.h,
                                            child: Text(
                                              " \₹ ${snapshot.data!.docs[position]['offerprice'].toString()}",
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
                                              '${snapshot.data!.docs[position]["offer"].toString()} \%Off',
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
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 1.w),
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
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
