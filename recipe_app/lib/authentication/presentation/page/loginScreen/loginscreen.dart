// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/loginStorageService.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_text_field.dart';
import 'package:recipe_app/authentication/presentation/cubit/googleCubit/googleCubit.dart';
import 'package:recipe_app/authentication/presentation/cubit/googleCubit/googleState.dart';
import 'package:recipe_app/authentication/presentation/loginCubit/loginCubit.dart';
import 'package:recipe_app/authentication/presentation/loginCubit/loginState.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_app/homePage/Presentation/Page/homeScreen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:another_flushbar/flushbar.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipe_app/authentication/presentation/widget/constant.dart';

import 'package:recipe_app/authentication/presentation/widget/custom_container.dart';

import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';
import 'package:recipe_app/recipe/presentation/screens/buttonNavogationBar.dart';

import '../../../domain/repository/googleRepository.dart';
import '../../widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStorageService loginService = LoginStorageService();
  // final _googleSignInKey = GlobalKey<GoogleSignInButtonState>();
  // final _googleSignIn = GoogleSignIn();
  // final _dio = Dio();
  // final _secureStorage = FlutterSecureStorage();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller =
      TextEditingController(text: "+977");

  final TextEditingController _passwordcontroller = TextEditingController();
  //bool _keywordVisibility = false;
  bool _isObscure = true;
  void securePassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),

                      const Text(
                        "Hello,",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      const Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        label: " Enter Username",
                        controller: _emailcontroller,
                        custvalidator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          } else if (value.length < 14) {
                            return "Please enter correct number";
                          } else if (!RegExp(r"[0-9]+$").hasMatch(value)) {
                            return "Please enter valid number";
                          } else if (value.length > 14) {
                            return "Invalid number ";
                          }
                          // return null;
                          // return "null";
                        },
                        autovalidarorMode: AutovalidateMode.onUserInteraction,
                        obSecureText: false,
                        keyBoard: TextInputType.phone,
                        //  focusNode: _focusNode,
                        autoNode: true,
                        lengthLimitingTextInputFormatter: 14,
                        // enabled: null,
                      ),
                      //   // CustomTextField(
                      //   //   controller: _emailcontroller,
                      //   //   label: 'Enter Email',
                      //   //   autovalidarorMode: AutovalidateMode.onUserInteraction,
                      //   //   custvalidator: (value) {
                      //   //     if (value == null || value.isEmpty) {
                      //   //       return 'This field is required';
                      //   //     }

                      //   //     // using regular expression
                      //   //     else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      //   //       return "Please enter a valid email address";
                      //   //     } else if (value.length < 8) {
                      //   //       return 'password must be at least 8 digits long';
                      //   //     }
                      //   //     // the email is valid
                      //   //     return null;
                      //   // },
                      //   //  ),
                      SizedBox(
                        height: 46.h,
                      ),
                      const Text(
                        " Password",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins"),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        icon1: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(value)) {
                            return 'Password must contain at least one special character.';
                          }
                          return null;
                        },
                        obSecureText: _isObscure,
                        keyBoard: TextInputType.emailAddress,
                        //focusNode: _focusNode,
                        autoNode: false, lengthLimitingTextInputFormatter: 15,
                      ),
                      SizedBox(
                        height: 20.h,
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
                        height: 24.h,
                      ),
                      //   // InkWell(
                      //   //   onTap: () {
                      //   //     if (_formKey.currentState!.validate()) {
                      //   //       return _formKey.currentState!.save();
                      //   //     } else {
                      //   //       print('unsucess');
                      //   //     }
                      //   //     //   Navigator.push(
                      //   //     //       context,
                      //   //     //       MaterialPageRoute(
                      //   //     //           builder: (context) => SignUpScreen()));

                      //   //     // ;
                      //   //     // _formKey.currentState?.validate();
                      //   //   },
                      //   //   child: CustomButton(
                      //   //     text: 'Sign In',
                      //   //   ),
                      //   // ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          // ignore: duplicate_ignore
                          if (state is LoginError) {
                            // ignore: avoid_print
                            print("error state listened");
                            // ignore: avoid_print
                            print(state.message);

                            Flushbar(
                              maxWidth: 344,
                              messageSize: 14,
                              padding: const EdgeInsets.only(
                                  top: 13, bottom: 13, left: 16),

                              borderRadius: BorderRadius.circular(8),
                              flushbarPosition: FlushbarPosition.TOP,
                              reverseAnimationCurve: Curves.decelerate,
                              backgroundColor: flushColor,
                              //titleColor: Colors.black,
                              // titleSize: 24,
                              icon: SvgPicture.asset('images/flushbar.svg'),
                              messageText: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  state.message,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              duration: const Duration(seconds: 6),
                              //  title:"Error",
                            ).show(context);
                            print("message");
                            print(state.message);
                          } else if (state is LoginLoaded) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CenteredBottomNavigation()),
                                (Route route) => false);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: btnColor,
                            ));
                          } else {
                            return InkWell(
                                child: CustomButton(
                                  text: 'Sign In',
                                ),
                                onTap: () {
                                  //  bool autovalidatemode = false;
                                  if (_formKey.currentState!.validate()) {
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

                                    // storage.write(
                                    //     key: "token", value: 'user_token');
                                    //  _formKey.currentState!.save();
                                    //  _formKey.currentState!.reset();
                                    //_formKey.currentState?.validate();
                                    // } else {
                                    //   // ignore: avoid_returning_null_for_void
                                  } else {
                                    CustomButton(
                                      text: "Sign in",
                                    );
                                  }
                                });
                          }

                          //       // ignore: curly_braces_in_flow_control_structures
                        },
                      ),
                      //   // if(required.)

                      //   // createUser(fg
                      //   //   _namecontroller.text,_emailcontroller.text,_passwordcontroller.text,_repasswordcontroller.text
                      //   // ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                        width: 50.h, height: 2, color: textColor //textColor,
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
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
                      listener: (context, state) {
                        if (state is GoogleSignInSuccess) {
                          loginService.saveLoginToken("loginToken");
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CenteredBottomNavigation()),
                              (Route route) => false);
                          // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
                          // Navigator.pushReplacement(
                          //     context,
                        } else if (state is GoogleSignInError) {
                          Flushbar(
                            maxWidth: 344,
                            padding: const EdgeInsets.only(top: 13, bottom: 13),
                            borderRadius: BorderRadius.circular(8),
                            flushbarPosition: FlushbarPosition.TOP,
                            reverseAnimationCurve: Curves.decelerate,
                            backgroundColor: flushColor,
                            icon: const Icon(Icons.message_rounded),
                            messageText: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                state.message,
                                // "Error",
                                // state.message,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),

                            duration: const Duration(seconds: 6),
                            //  title:"Error",
                          ).show(context);
                          print("message");
                          print("error show");
                          // ignore: avoid_print
                          //print(state.message);
                        }
                      },
                      builder: (context, state) {
                        // if (state is GoogleSignInInitial) {
                        //   return InkWell(
                        //     onTap:
                        //         context.read<GoogleSignInCubit>().GoogleLogin,
                        //     // .signInWithGoogle, //_handleGoogleSignIn,
                        //     child: CustomContainer(
                        //       image: 'images/icon1.png',
                        //       //image: "images/logo1.png",
                        //     ),
                        //   );
                        // }
                        if (state is GoogleSignInLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return InkWell(
                            // ignore: sort_child_properties_last
                            child: CustomContainer(
                              image: 'images/icon1.png',
                              //image: "images/logo1.png",
                            ),

                            onTap:
                                context.read<GoogleSignInCubit>().googleLogin,
                            //   () async {
                            // await context
                            //     .read<GoogleSignInCubit>()
                            //     .googleLogin();
                            //},
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<GoogleSignInCubit>().dicontinue();
                        // UserRepository().dicontinue();
                      },
                      child: CustomContainer(
                        image: 'images/icon2.png',
                        //image: "images/logo1.png",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
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
                                builder: (context) => const SignUpScreen()));
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
                // Padding(
                //     padding: EdgeInsets.only(
                //         bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
