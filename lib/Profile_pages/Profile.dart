import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp2/Profile_pages/AboutUs.dart';
import 'package:ecommerceapp2/Profile_pages/Myorder.dart';
import 'package:ecommerceapp2/authentication/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Toastmessage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;
  final picker = ImagePicker();

  Future getImageGallery(AsyncSnapshot<QuerySnapshot> snapshot) async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        final id = DateTime.now().microsecondsSinceEpoch.toString();
        Reference folder = Storage.ref("/Folder name/" + id);
        UploadTask uploadtask = folder.putFile(image!.absolute);
        Future.value(uploadtask).then((onValue) async {
          var newUrl = await folder.getDownloadURL();
          profileedit
              .doc(snapshot.data!.docs[index]["id"].toString())
              .update({"profile": newUrl.toString()}).then((Value) {
            ToastMessage().toastmessage(message: "Upload Succesfully");
          }).onError((e, s) {});
        });
      }
    });
  }

  Future getImageCamera(AsyncSnapshot<QuerySnapshot> snapshot) async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("hello" + pickedFile.path);

        final id = DateTime.now().microsecondsSinceEpoch.toString();
        Reference folder = Storage.ref("/Folder name/" + id);
        UploadTask uploadtask = folder.putFile(image!.absolute);
        Future.value(uploadtask).then((onValue) async {
          var newUrl = await folder.getDownloadURL();
          profileedit
              .doc(snapshot.data!.docs[index]["id"].toString())
              .update({"profile": newUrl.toString()}).then((Value) {
            ToastMessage().toastmessage(message: "Upload Succesfully");
          }).onError((error, s) {ToastMessage().toastmessage(message: error.toString());});
        });



      } else {
        print("No image Picked");
      }
    });
  }

  FirebaseStorage Storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  int index = 0;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final profile = FirebaseFirestore.instance.collection("Users").snapshots();
  final profileedit=FirebaseFirestore.instance.collection("Users");
  TextEditingController texteditcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Checkout',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: profile,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
    return Center(
    child: CircularProgressIndicator(),
    );
    }
    if (snapshot.hasError) {
    return Center(
    child: Text("ERROR"),
    );
    }
    if (snapshot.hasData) {
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
    if (snapshot.data!.docs[i]["id"] ==
    auth.currentUser!.uid.toString()) {
    index = i;
    }
    }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 96.w,
                        height: 96.h,
                        decoration: ShapeDecoration(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(100.r),
                            child: Image.network(snapshot.data!.docs[index]["profile"].toString(),fit: BoxFit.cover,)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 70.w, top: 60.h),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 180.h,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 25.w),
                                      child: Row(
                                        children: [
                                          GestureDetector(onTap: () {
                                            getImageCamera(snapshot);
                                            Navigator.of(context).pop();
                                    },
                                            child: Container(
                                              width: 150.w,
                                              height: 100.h,
                                              decoration: ShapeDecoration(
                                                color: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10.r),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: 40.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30.w),
                                          GestureDetector(onTap: () {
                                            getImageGallery(snapshot);
                                            Navigator.of(context).pop();
                                          },
                                            child: Container(
                                              width: 150.w,
                                              height: 100.h,
                                              decoration: ShapeDecoration(
                                                color: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10.r),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.image,
                                                color: Colors.white,
                                                size: 40.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF4392F9),
                              shape: OvalBorder(
                                side: BorderSide(width: 3.w, color: Colors.white),
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Container(
                    width: 330.w,
                    height: 90.h,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20.w),
                            SizedBox(
                              width: 230.w,
                              height: 30.h,
                              child: Text(
                                snapshot.data!.docs[index]["name"].toString(),
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("update here"),
                                    content: TextField(
                                      controller: texteditcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Type here"),
                                      maxLines: 1,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          profileedit
                                              .doc(auth.currentUser!.uid
                                              .toString())
                                              .update({
                                            "name": texteditcontroller.text
                                          }).then((onValue) {
                                            Fluttertoast.showToast(
                                                msg: "Update Succesfully");
                                          }).onError((error, StackTrace) {
                                            Fluttertoast.showToast(
                                                msg: "Error");
                                          });
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.green,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("Update"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            snapshot.data!.docs[index]["email"].toString(),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Myorder()));
                    },
                    child: Container(
                      width: 340.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFC6D6D3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Container(
                              height: 50.h,
                              width: 100.w,
                              child: Center(
                                child: Text(
                                  'My Order ',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 170.w),
                          Container(
                              width: 50.w,
                              height: 50.h,
                              child: Icon(Icons.double_arrow))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Aboutus()));
                    },
                    child: Container(
                      width: 340.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFC6D6D3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Container(
                              height: 50.h,
                              width: 100.w,
                              child: Center(
                                child: Text(
                                  'About Us ',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 170.w),
                          Container(
                              width: 50.w,
                              height: 50.h,
                              child: Icon(Icons.double_arrow))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => Login()),
                          (route) => (false));
                    },
                    child: Container(
                      width: 340.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFC6D6D3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Container(
                              height: 50.h,
                              width: 100.w,
                              child: Center(
                                child: Text(
                                  'Logout ',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 170.w),
                          Container(
                              width: 50.w,
                              height: 50.h,
                              child: Icon(Icons.double_arrow))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }else {return SizedBox();}}
        ),
      ),
    );
  }
}
