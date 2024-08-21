import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 20.h,right: 10.w),
            child: Text(
                "An e-commerce app with a backend powered by Firebase and a frontend built using Flutter is a modern and efficient way to create a robust online shopping platform. Here’s a brief overview:Frontend: FlutterCross-Platform Development: Flutter allows you to create a single codebase that runs on both Android and iOS, saving development time and resources.Rich UI/UX: Flutter provides a wide range of pre-built widgets and a flexible UI system, enabling the creation of visually appealing and responsive designs that enhance user experience.State Management: Options like Provider, Riverpod, or Bloc help manage the app's state, ensuring smooth and consistent interactions across different screens and features.Integration: Flutter seamlessly integrates with Firebase, making it easier to handle authentication, data storage, and other backend functionalities."),
          )),
    );
  }
}
