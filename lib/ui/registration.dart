


import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myecom/const/app_colors.dart';
import 'package:myecom/ui/userForm.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  bool _obscureText=true;
  
  signUp()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      var authCredential=userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>UserForm()));

        
      }
      else{
        Fluttertoast.showToast(msg: "Something is Wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account alrady exists for that email");
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deep_orange,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(28.r),
                      topLeft: Radius.circular(28.r),
                    )

                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h,),
                          Text("Welcome Budy",style: TextStyle(
                            fontSize: 22.sp, color: AppColor.deep_orange
                          ),),
                          Text("Glad to see you back my buddy",
                          style: TextStyle(fontSize: 14.sp,
                          color: Color(0xFFBBBBBB)),),
                          SizedBox(height: 15.h,),

                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                  color: AppColor.deep_orange,
                                  borderRadius: BorderRadius.circular(12.r)

                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Expanded(
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: "Please Enter email",
                                      hintStyle: TextStyle(
                                        fontSize: 15.sp,
                                        color: AppColor.deep_orange
                                      )

                                    ),

                              ))

                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                    color: AppColor.deep_orange,
                                    borderRadius: BorderRadius.circular(12.r)

                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.password_outlined,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Expanded(
                                  child: TextField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                        hintText: "Please Enter password",
                                        hintStyle: TextStyle(
                                            fontSize: 15.sp,
                                            color: AppColor.deep_orange
                                        ),
                                      suffixIcon: _obscureText==true?
                                          IconButton(onPressed:() {
                                            setState((){
                                              _obscureText=false;
                                            });
                                          }, icon: Icon(
                                            Icons.remove_red_eye
                                          )):IconButton(onPressed: (){
                                        setState((){
                                          _obscureText=true;
                                        });
                                      },
                                          icon: Icon(
                                            Icons.visibility
                                          ))

                                    ),

                                  ))

                            ],
                          ),
                          SizedBox(height: 50.h,),
                          SizedBox(width: 1.sw,height: 56.h,
                          child: ElevatedButton(
                            onPressed: (){
                              signUp();

                            },
                              child: Text("Continue",style: TextStyle(
                                color: Colors.white,fontSize: 18.sp
                              ),
                              ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.deep_orange,
                              elevation: 3
                            ),
                          ),
                          ),

                        ],
                      ),
                    ),
                  ),

            ))
          ],
        ),
      ),

    );
  }
}
