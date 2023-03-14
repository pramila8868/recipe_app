import 'package:flutter/material.dart';
import 'package:recipe_app/HomePage/Presentation/Page/homeScreen.dart';
import 'package:recipe_app/authentication/presentation/Common/Dio/cubit/Login_cubit.dart';
import 'package:recipe_app/authentication/presentation/Common/Dio/cubit/login_state.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/authentication/presentation/Common/google/cubit/google_cubit.dart';
import 'package:recipe_app/authentication/presentation/Common/google/cubit/google_state.dart';
import 'package:recipe_app/authentication/presentation/Widget/constant.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_button.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_container.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_text_field.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isObscure = true;
  void securePassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            // parent: AlwaysScrollableScrollPhysics()),
            // physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
          
              children: [
                SizedBox(
                  height: 54.h,
                ),
                const Text(
                  "Hello,",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                SizedBox(
                  height: 57.h,
                ),
                const Text(
                  " Enter UserName",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 26.h,
                ),
                CustomTextField(
                  label: "UserName",
                  controller: _emailcontroller,
                  custvalidator: (value) {
                    if (value!.isEmpty) {
                      return "required username";
                    }
                    return "null";
                  },
                  autovalidarorMode: AutovalidateMode.onUserInteraction,
                  obSecureText: false,
                  keyBoard: TextInputType.phone,
                  //  focusNode: _focusNode,
                  autoNode: true,
                ),
                // CustomTextField(
                //   controller: _emailcontroller,
                //   label: 'Enter Email',
                //   autovalidarorMode: AutovalidateMode.onUserInteraction,
                //   custvalidator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'This field is required';
                //     }

                //     // using regular expression
                //     else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                //       return "Please enter a valid email address";
                //     } else if (value.length < 8) {
                //       return 'password must be at least 8 digits long';
                //     }
                //     // the email is valid
                //     return null;
                // },
                //  ),
                SizedBox(
                  height: 30.h,
                ),
                const Text(
                  "Enter Password",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins"),
                ),
                SizedBox(
                  height: 26.h,
                ),
                CustomTextField(
                  icon1: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: textColor,
                      ),
                      onPressed: securePassword),
                  controller: _passwordcontroller,
                  label: 'Enter Password',
                  autovalidarorMode: AutovalidateMode.onUserInteraction,
                  custvalidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long.';
                    }
                    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                      return 'Password must contain at least one letter.';
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Password must contain at least one number.';
                    }
                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'Password must contain at least one special character.';
                    }
                    return null;
                  },
                  obSecureText: _isObscure,
                  keyBoard: TextInputType.emailAddress,
                  //focusNode: _focusNode,
                  autoNode: false,
                ),
                SizedBox(
                  height: 19.h,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: text1Color),
                    )),
                SizedBox(
                  height: 25.h,
                ),
                // InkWell(
                //   onTap: () {
                //     if (_formKey.currentState!.validate()) {
                //       return _formKey.currentState!.save();
                //     } else {
                //       print('unsucess');
                //     }
                //     //   Navigator.push(
                //     //       context,
                //     //       MaterialPageRoute(
                //     //           builder: (context) => SignUpScreen()));

                //     // ;
                //     // _formKey.currentState?.validate();
                //   },
                //   child: CustomButton(
                //     text: 'Sign In',
                //   ),
                // ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      print("error state listened");
                      print(state.message);

                      Flushbar(
                        messageSize: 14,
                        padding: const EdgeInsets.only(top: 13, bottom: 13),

                        borderRadius: BorderRadius.circular(8),
                        flushbarPosition: FlushbarPosition.TOP,
                        reverseAnimationCurve: Curves.decelerate,
                        backgroundColor: flushColor,
                        //titleColor: Colors.black,
                        // titleSize: 24,
                        message: state.message,
                        messageColor: Colors.white,
                        duration: Duration(seconds: 6),
                        //  title:"Error",
                      ).show(context);
                      print("message");
                    } else if (state is LoginLoaded) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginInitial) {
                      return InkWell(
                        child: CustomButton(
                          text: 'Sign Up',
                        ),
                        onTap: () {
                          //var name = _namecontroller.text;
                          var email = _emailcontroller.text;
                          var password = _passwordcontroller.text;
                          // var repassword = _repasswordcontroller.text;
                          // var invitation = _invitationCodeController.text;
                          _formKey.currentState!.validate()
                              ?
                              //  if (_formKey.currentState?.validate()):
                              context.read<LoginCubit>().LogIn(
                                    //_namecontroller.text,
                                    //  _phnumbercontroller.text,
                                    email,
                                    password,
                                    // repassword,
                                    // invitation = "",
                                  )
                              : CustomButton(text: "Sign up");
                          // _formKey.currentState?.validate();
                        },
                      );
                    } else if (state is LoginLoading) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: btnColor,
                      ));
                    } else if (state is LoginLoaded) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },

                        // createUser(fg
                        //   _namecontroller.text,_emailcontroller.text,_passwordcontroller.text,_repasswordcontroller.text
                        // ),
                        child: CustomButton(
                          text: 'Sign Up',
                        ),
                      );
                    } else {
                      return InkWell(
                        child: CustomButton(
                          text: 'Sign Up',
                        ),
                        onTap: () {
                          //var name = _namecontroller.text;
                          var email = _emailcontroller.text;
                          var password = _passwordcontroller.text;
                          // var repassword = _repasswordcontroller.text;
                          // var invitation = _invitationCodeController.text;
                          context.read<LoginCubit>().LogIn(
                                //_namecontroller.text,
                                //  _phnumbercontroller.text,
                                email,
                                password,
                                // repassword,
                                // invitation = "",
                              );
                          //  _formKey.currentState?.validate();
                        },
                      );
                    }

                    // ignore: curly_braces_in_flow_control_structures
                  },
                ),
                // if(required.)

                // createUser(fg
                //   _namecontroller.text,_emailcontroller.text,_passwordcontroller.text,_repasswordcontroller.text
                // ),

                SizedBox(
                  height: 19.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 50.h,
                      height: 2,
                      color: textColor,
                    ),
                    Text(
                      " Or Sign in With ",
                      style: TextStyle(color: textColor),
                    ),
                    Container(
                      width: 50.h,
                      height: 2,
                      color: textColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is GoogleSignInInitial) {
                          return InkWell(
                            onTap:
                                context.read<GoogleSignInCubit>().GoogleLogin,
                            // .signInWithGoogle, //_handleGoogleSignIn,
                            child: CustomContainer(
                              image: 'images/icon1.png',
                              //image: "images/logo1.png",
                            ),
                          );
                        }
                        if (state is GoogleSignInLoading) {
                          return CircularProgressIndicator();
                        } else {
                          return InkWell(
                            onTap:
                                context.read<GoogleSignInCubit>().GoogleLogin,
                            //.signInWithGoogle, //_handleGoogleSignIn,
                            child: CustomContainer(
                              image: 'images/icon1.png',
                              //image: "images/logo1.png",
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: 25.h,
                    ),
                    CustomContainer(
                      image: 'images/icon2.png',
                      //image: "images/logo1.png",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 54,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: text1Color,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                // CustomContainer(
                //   image: "images/logo2.png",
                // )
                SizedBox(
                  height: 99.h,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
