import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myecom/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myecom/ui/login_page.dart';
import 'package:myecom/ui/registration.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),()=>{
Navigator.push(context, CupertinoPageRoute(builder: (context)=>Registration()))

    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deep_orange,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("E-Commerce", style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold,color: Colors.white),),
           SizedBox(height: 10.h,),
            CircularProgressIndicator(color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
