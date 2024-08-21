import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderTrack extends StatefulWidget {
  final String status;
  const OrderTrack({super.key, required this.status});

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {

  late Status currentstatus;

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget build(BuildContext context) {

    if(widget.status=="order placed"){
      setState(() {
        currentstatus=Status.order;

      });

    }
    else if( widget.status=="shipped"){
      setState(() {
        currentstatus =Status.shipped;
      });
    }
    else if (widget.status=="out of delivery"){
      setState(() {
        currentstatus =Status.outOfDelivery;
    });}
    else{
      setState(() {
        currentstatus=Status.delivered;
      });
    }



    return Scaffold(

body:  SafeArea(
  child: Padding(
    padding:  EdgeInsets.only(left: 15.w,top: 60.h),
    child: OrderTracker(
      status: currentstatus,
      activeColor: Colors.green,
      inActiveColor: Colors.grey[300],
      orderTitleAndDateList: orderList,
      shippedTitleAndDateList: shippedList,
      outOfDeliveryTitleAndDateList: outOfDeliveryList,
      deliveredTitleAndDateList: deliveredList,
    ),
  ),
),



    );
  }
}
