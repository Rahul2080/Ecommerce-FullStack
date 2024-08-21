import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../Toastmessage.dart';

class Purchase extends StatefulWidget {
  final String image;
  final String productname;
  final String price;
  final String about;
  final String id;
  final String offerprice;
  final String ratting;
  final String offer;

  const Purchase({super.key,
    required this.image,
    required this.productname,
    required this.price,
    required this.about,
    required this.id,
    required this.offerprice,
    required this.ratting,
    required this.offer,
    });

  @override
  State<Purchase> createState() => _PurchaseState();
}
FirebaseAuth auth = FirebaseAuth.instance;
class _PurchaseState extends State<Purchase> {

  final updateorder = FirebaseFirestore.instance
      .collection("Users").doc(auth.currentUser!.uid.toString())
      .collection("orders");
  void handlePaymentErrorResponse(PaymentFailureResponse response) {


    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response
            .message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {

    updateorder.doc(widget.id).set({
      "imgUrl": widget.image,
      "id": widget.id,
      "ratting": widget.ratting,
      "price": widget.price,
      "productName": widget.productname,
      "about": widget.about,
      "offerprice": widget.offerprice,
      "offer": widget.offer,
      "status": "order placed",
    }).then((onValue) {
      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: "Order succesfully");
    }).onError((error, stackTrace) => ToastMessage()
        .toastmessage(message: error.toString()));


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
      appBar: AppBar(
        title: Text(
          'Shopping Bag',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 0.09.h,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Container(
              width: 426.w,
              height: 153.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 123.w,
                    height: 153.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: SizedBox(
                          width: 188.w,
                          height: 23.h,
                          child: Text(
                           widget.productname,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 188.w,
                        height: 40.h,
                        child: Text(
                         widget.about,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                              '10 May 2XXX',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.10.w,
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
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 20.h),
            child: Row(
              children: [
                Text(
                  'Apply Coupons',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.70.w,
                    ),
                  ),
                ),
                SizedBox(width: 180.w),
                Text(
                  'Select',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.70.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: Text(
              'Order Payment Details',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.70.w,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 20.h),
            child: Row(
              children: [
                Text(
                  'Order Amounts',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.70.w,
                    ),
                  ),
                ),SizedBox(width: 140.w),
                SizedBox(width: 100.w,height: 30.h,
                  child: Text(
                    " ${widget.price}\.00",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 10.h),
            child: Row(
              children: [
                Text(
                  'Convenience',
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.70.w,
                  ),),
                ),SizedBox(width: 20.w),
                Text(
                  'Know More',
                  style:GoogleFonts.montserrat(
                textStyle:  TextStyle(
                    color: Color(0xFFF73658),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),),
                ),SizedBox(width: 70.w),
                SizedBox(width: 100.w,height: 20.h,
                  child: Text(
                    'Apply Coupon',
                    textAlign: TextAlign.right,
                    style:GoogleFonts.montserrat(
                      textStyle:  TextStyle(
                      color: Color(0xFFE91611),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 10.h),
            child: Row(
              children: [
                Text(
                    'Delivery Fee',
                    style:GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.70.w,
                      ),
                    )),SizedBox(width:180.w ),


            SizedBox(width: 100.w,height: 30.h,
              child: Text(
                'Free',
                textAlign: TextAlign.right,
                style:GoogleFonts.montserrat(
                  textStyle: TextStyle(
                  color: Color(0xFFF73658),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),),),
            ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
            child: Divider(),
          ),

          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 20.h),
            child: Row(
              children: [
                Text(
                  'Order Total',
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.70.w,
                  ),
                ),),
                SizedBox(width: 170.w,),
                SizedBox(width: 100.w,height: 30.h,
                  child: Text(
                   " ${widget.price}\.00",
                    textAlign: TextAlign.right,
                    style:GoogleFonts.montserrat(
                      textStyle:  TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 20.h),
            child: Row(
              children: [
                Text(
                  'EMI  Available ',
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.70.w,
                  ),),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Details',
                  textAlign: TextAlign.right,
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Color(0xFFF73658),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),),
              ],
            ),
          ),
          SizedBox(height: 80.h),
          Center(
            child: GestureDetector(onTap: (){
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
                ),child: Center(
                  child: Text(
                  'Proceed to Payment',
                  textAlign: TextAlign.center,
                  style:GoogleFonts.montserrat(
                    textStyle:  TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.41.w,
                  ),
                              ), ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
