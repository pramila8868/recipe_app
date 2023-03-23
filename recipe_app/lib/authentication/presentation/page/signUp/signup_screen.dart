import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/Widget/checkbox.dart';
import 'package:recipe_app/authentication/presentation/Widget/constant.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_button.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:another_flushbar/flushbar.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/authentication/presentation/cubit/signUpCubit/signUpCubit.dart';
import 'package:recipe_app/authentication/presentation/cubit/signUpCubit/signUpState.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/data/checkbox/cubit/checkboxCubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //key/ validate form is id  is in the form of key
  final TextEditingController _invitationCodeController = TextEditingController();

  final TextEditingController _namecontroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _phnumbercontroller =
      TextEditingController(text: "+977");

  final TextEditingController _repasswordcontroller = TextEditingController();
  bool _isObscure = true;
  void securePassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  bool _rescurePassword = true;
  void resecurePassord() {
    setState(() {
      _rescurePassword = !_rescurePassword;
    });
  }

  //SignUpScreen({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  @override

  // final passwordValidator = multi([
  //   RequiredValidator(errorText: 'password is required'),
  //   MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  //   PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  // ]);
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          return false;
        },
        child: Scaffold(
          //  body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      const Text(
                        "Create an account,",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const Text(
                        "Let's help you set up your account, it\n won't take long",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      const Text(
                        " Name",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        controller: _namecontroller,
                        label: 'Enter Name',
                        autovalidarorMode: AutovalidateMode.onUserInteraction,
                        custvalidator: (value) {
                          if (value!.length < 3 && value.isNotEmpty)
                            return "name is short";
                          else if (value.isEmpty) {
                            return "This field is required";
                          } else if (!RegExp(r"[a-zA-Z]+$").hasMatch(value)) {
                            return " Please enter a valid name";
                          } else if (value.length > 25) {
                            return "Name must be 11characters or less";
                          }
                          return null;
                          // }
                        },
                        obSecureText: false,
                        keyBoard: TextInputType.name,
                        //focusNode: _focusNode,
                        autoNode: true, lengthLimitingTextInputFormatter: 20,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Text(
                        " Ph number",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        // enabled: true,
                        // initialvalue: "+977",
                        controller: _phnumbercontroller,
                        label: 'Enter number',

                        autovalidarorMode: AutovalidateMode.onUserInteraction,
                        custvalidator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          } else if (value.length < 14) {
                            return "Please enter correct number";
                          } else if (!RegExp(r"[0-9]+$").hasMatch(value)) {
                            return "Please enter valid number";
                          } else if (value.length > 14) {
                            return "Invalid number ";
                          }
                          //  }
                          return null;
                        },
                        obSecureText: false,
                        keyBoard: TextInputType.phone,
                        //focusNode: _focusNode,
                        autoNode: true, lengthLimitingTextInputFormatter: 14,
                        // custvalidator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'This field is required';
                        //   }

                        //   // using regular expression
                        //   else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        //     return "Please enter a valid email address";
                        //   } else if (value.length < 8) {
                        //     return 'password must be at least 8 digits long';
                        //   }
                        //   // the email is valid
                        //   return null;
                        // },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Text(
                        " Email",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        controller: _emailcontroller,
                        label: 'Enter Email',
                        autovalidarorMode: AutovalidateMode.onUserInteraction,
                        custvalidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // using regular expression
                          else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          } else if (value.length < 8) {
                            return 'Email must be at least 8 digits long';
                          } else if (!value.endsWith("com")) {
                            return ("Enter valid email");
                          }
                          // the email is valid
                          return null;
                        },
                        obSecureText: false,
                        keyBoard: TextInputType.emailAddress,
                        //focusNode: _focusNode,
                        autoNode: true, lengthLimitingTextInputFormatter: 33,
                      ),
                      SizedBox(
                        height: 20.h,
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
                        // icon1: ,
                        // icon1: Icon(_isObscure
                        //     ? Icons.visibility_off
                        //     : Icons.visibility_off),
                        controller: _passwordcontroller,
                        label: 'Enter Password',
                        //length: 8,
                        obSecureText: _isObscure,
                        autovalidarorMode: AutovalidateMode.onUserInteraction,
                        custvalidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required.';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          } else if (value.length > 15) {
                            return 'Password is too long .';
                          } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                            return 'Password must contain at least one letter.';
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one number.';
                          } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(value)) {
                            return 'Password must contain at least one special character.';
                          }
                          return null;
                        },
                        keyBoard: TextInputType.text,
                        focusNode: _focusNode,
                        autoNode: true, lengthLimitingTextInputFormatter: 15,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // const Text(
                      //   " confirm Password",
                      //   style: TextStyle(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w400,
                      //       fontFamily: "Poppins"),
                      // ),

                      const Text(
                        "Re-enter Password",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),

                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        icon1: IconButton(
                            icon: Icon(
                              _rescurePassword
                                  //  _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: textColor,
                            ),
                            onPressed: resecurePassord //securePassword
                            ),
                        controller: _repasswordcontroller,
                        label: ' Enter Retype Password',
                        autovalidarorMode: AutovalidateMode.onUserInteraction,
                        custvalidator: (
                          value,
                        ) {
                          {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            } else if (value != _passwordcontroller.text) {
                              return 'Passwords do not match.';
                            }
                            return null; // Return null if the confirm password is valid.
                          }
                        },
                        obSecureText: _rescurePassword,
                        keyBoard: TextInputType.text,
                        //focusNode: _focusNode,
                        autoNode: true, lengthLimitingTextInputFormatter: 15,
                      ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const CheckboxCustom(),
                          Text(
                            "Accept terms & Condition",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: text1Color),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 24.h,
                      ),
                      BlocConsumer<SignupCubit, SignupState>(
                          listener: (context, state) {
                        if (state is SignupError) {
                          print("error state listened");
                          print(state.message);

                          Flushbar(
                            maxWidth: 344,
                            padding: const EdgeInsets.only(top: 13, bottom: 13),
                            borderRadius: BorderRadius.circular(8),
                            flushbarPosition: FlushbarPosition.TOP,
                            reverseAnimationCurve: Curves.decelerate,
                            backgroundColor: flushColor,

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
                        } else if (state is SignupLoaded) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                        // if(required.)
                      }, builder: (context, state) {
                        // if (state is SignupInitial) {
                        // return BlocBuilder<CheckboxCubit, bool>(
                        //   builder: (context, checkStatus) {
                        //     return InkWell(
                        //         child: CustomButton(
                        //           text: 'Sign Up',
                        //         ),
                        //         onTap: () {
                        //           //   if (checkStatus) {
                        //           // var name = _namecontroller.text;
                        //           // var email = _emailcontroller.text;
                        //           // var password = _passwordcontroller.text;
                        //           // var repassword =
                        //           //     _repasswordcontroller.text;
                        //           // var invitation =
                        //           //     _invitationCodeController.text;
                        //           //  context
                        //           //.read<CheckboxCubit>()
                        //           //   .state //updateCheckbox;//state
                        //           //?
                        //           // _formKey.currentState!.validate()
                        //           //     ? context
                        //           //         .read<SignupCubit>()
                        //           //         .PostUser(
                        //           //           _namecontroller.text,
                        //           //           _phnumbercontroller.text,
                        //           //           email,
                        //           //           password,
                        //           //           // repassword,
                        //           //           invitation = "",
                        //           //         )
                        //           //     : CustomButton(text: "Sign up");
                        //           // } else {
                        //           //   print("error");
                        //           // }

                        //           // if (checkStatus) {
                        //           //   CustomButton(text: "Sign Up");
                        //           // } else {
                        //           //   _formKey.currentState!.validate();
                        //           //   // _formKey.currentContext
                        //           //   //     ?validate();
                        //           // }
                        //           final isValidForm =
                        //               _formKey.currentState!.validate();

                        //           if (isValidForm) {
                        //             if (checkStatus) {
                        //               var name = _namecontroller.text;
                        //               var email = _emailcontroller.text;
                        //               var password =
                        //                   _passwordcontroller.text;
                        //               var repassword =
                        //                   _repasswordcontroller.text;
                        //               var invitation =
                        //                   _invitationCodeController.text;

                        //               context.read<SignupCubit>().PostUser(
                        //                     _namecontroller.text,
                        //                     _phnumbercontroller.text,
                        //                     email,
                        //                     password,
                        //                     // repassword,
                        //                     invitation = "",
                        //                   );
                        //             } else {
                        //               ScaffoldMessenger.of(context)
                        //                   .showSnackBar(
                        //                 const SnackBar(
                        //                     content: Text(
                        //                         'Please accept the terms and conditions')),
                        //               );
                        //             }
                        //           }
                        //           //else {
                        //           //   CustomButton(text: "Sign up");
                        //           // }
                        //           // else{

                        //           // }
                        //           // } else {
                        //           //   CustomButton(
                        //           //     text: "SignIn",
                        //           //   );

                        //           //  if(_formKey.currentContext.)
                        //           // } else
                        //           //   _namecontroller.text.toString();
                        //           //else {
                        //           //   var validate = _formKey.currentState!
                        //           //       .validate(_namecontroller.text);
                        //           // }

                        //           //else {
                        //           //   _formKey.currentState.()
                        //           //   // _phnumbercontroller.text,
                        //           //   //  email,
                        //           //   //password,
                        //           //   // repassword,
                        //           //   //invitation = "",
                        //           // }

                        //           // if (_formKey.currentState!
                        //           //     .validate()) {
                        //           //   context
                        //           //       .read<SignupCubit>()
                        //           //       .PostUser(
                        //           //         _namecontroller.text,
                        //           //         _phnumbercontroller.text,
                        //           //         email,
                        //           //         password,
                        //           //         // repassword,
                        //           //         invitation = "",
                        //           //       );

                        //           //   // } else if (checkStatus) {
                        //           //   //   CustomButton(text: "Sign up");
                        //           //   // } else {
                        //           // }
                        //           //  if()
                        //           // else {
                        //           //   CustomButton(text: "Sign up");
                        //           // }
                        //         }
                        //         //  else{
                        //         //   print("error");

                        //         );
                        //   },
                        // );
                        //}
                        if (state is SignupLoading) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: btnColor,
                          ));
                          // ignore: curly_braces_in_flow_control_structures
                        } else {
                          return
                              // ignore: curly_braces_in_flow_control_structures
                              BlocBuilder<CheckboxCubit, bool>(
                            builder: (context, checkStatus) {
                              return InkWell(
                                  child: CustomButton(
                                    text: 'Sign Up',
                                  ),
                                  onTap: () {
                                    //final isValidForm =
                                    //  _formKey.currentState!.validate();

                                    if (_formKey.currentState!.validate()) {
                                      if (checkStatus) {
                                        var name = _namecontroller.text;
                                        var email = _emailcontroller.text;
                                        var password = _passwordcontroller.text;
                                        var repassword =
                                            _repasswordcontroller.text;
                                        var invitation =
                                            _invitationCodeController.text;

                                        context.read<SignupCubit>().PostUser(
                                              _namecontroller.text,
                                              _phnumbercontroller.text,
                                              email,
                                              password,
                                              // repassword,
                                              invitation = "",
                                            );
                                      } else {
                                        Flushbar(
                                          maxWidth: 344,
                                          padding: const EdgeInsets.only(
                                              top: 13, bottom: 13),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          reverseAnimationCurve:
                                              Curves.decelerate,
                                          backgroundColor: textColor,

                                          // ignore: prefer_const_constructors
                                          messageText: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: const Text(
                                              'Please accept the terms and conditions',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),

                                          duration: const Duration(seconds: 6),
                                          //  title:"Error",
                                        ).show(context);
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(
                                        //   const SnackBar(
                                        //       content: Text(
                                        //           'Please accept the terms and conditions')),
                                        // );
                                      }
                                      // } else {
                                      //   InkWell(
                                      //     child: CustomButton(
                                      //       text: 'Sign Up',
                                      //     ),
                                      //     onTap: () {
                                      //       var name = _namecontroller.text;
                                      //       var email = _emailcontroller.text;
                                      //       var password = _passwordcontroller.text;
                                      //       var repassword =
                                      //           _repasswordcontroller.text;
                                      //       var invitation =
                                      //           _invitationCodeController.text;
                                      //       context.read<SignupCubit>().PostUser(
                                      //             _namecontroller.text,
                                      //             _phnumbercontroller.text,
                                      //             email,
                                      //             password,
                                      //             // repassword,
                                      //             invitation = "",
                                      //           );
                                      //       _formKey.currentState?.validate();
                                      //     },
                                      //   );
                                      // CustomButton(text: "Sign up");
                                      //}
                                    } else {
                                      CustomButton(text: "Sign up");
                                    }
                                  });
                            },
                          );
                        }
                      }),

                      const SizedBox(
                        height: 28,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: text1Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // )
        ),
      ),
    );
  }
}
