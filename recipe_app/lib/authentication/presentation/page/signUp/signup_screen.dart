import 'package:flutter/material.dart';
import 'package:recipe_app/HomePage/Presentation/Page/homeScreen.dart';
import 'package:recipe_app/authentication/presentation/Widget/checkbox.dart';
import 'package:recipe_app/authentication/presentation/Widget/constant.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_button.dart';
import 'package:recipe_app/authentication/presentation/Widget/custom_text_field.dart';
import 'package:recipe_app/authentication/presentation/cubit/signup_cubit.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //key/ validate form is id  is in the form of key
  TextEditingController _invitationCodeController = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 54.h,
                ),
                const Text(
                  "Create an account,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Text(
                  "Let's help you set up your account, it\n won't take long",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                SizedBox(
                  height: 18.h,
                ),
                const Text(
                  " Name",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: _namecontroller,
                  label: 'Enter Name',
                  autovalidarorMode: AutovalidateMode.onUserInteraction,
                  custvalidator: (value) {
                    if (value!.length < 3 && value.isNotEmpty)
                      return "name is short";
                    else if (value.isEmpty) {
                      return "Required name";
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
                  focusNode: _focusNode,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  " Ph number",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  // enabled: true,
                  // initialvalue: "+977",
                  controller: _phnumbercontroller,
                  label: 'Enter number',
                  autovalidarorMode: AutovalidateMode.onUserInteraction,
                  custvalidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ph number is required";
                    } else if (value.length < 15) {
                      return "Please enetr correct number";
                    } else if (!RegExp(r"[0-9]+$").hasMatch(value)) {
                      return "Please enter valid number";
                    } else if (value.length == 15) {
                      return "Number must be 14 ";
                    }
                    //  }
                    return null;
                  },
                  obSecureText: false, keyBoard: TextInputType.phone,
                  focusNode: _focusNode,
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
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
                  focusNode: _focusNode,
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
                  height: 5.h,
                ),
                CustomTextField(
                  icon1: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: textColor,
                      ),
                      onPressed: securePassword),
                  // icon1: ,
                  // icon1: Icon(_isObscure
                  //     ? Icons.visibility_off
                  //     : Icons.visibility_off),
                  controller: _passwordcontroller,
                  label: 'Enter Password',
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
                  keyBoard: TextInputType.text, focusNode: _focusNode,
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
                  " Re-enter Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),

                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  icon1: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: textColor,
                      ),
                      onPressed: securePassword),
                  controller: _repasswordcontroller,
                  label: 'Retype Password',
                  autovalidarorMode: AutovalidateMode.onUserInteraction,
                  custvalidator: (
                    value,
                  ) {
                    {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required.';
                      } else if (value != _passwordcontroller.text) {
                        return 'Passwords do not match.';
                      }
                      return null; // Return null if the confirm password is valid.
                    }
                  },
                  obSecureText: _isObscure,
                  keyBoard: TextInputType.text,
                  focusNode: _focusNode,
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
                  height: 25.h,
                ),
                BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                  if (state is SignupError) {
                    print("error state listened");
                    print(state.message);

                    Flushbar(
                      flushbarPosition: FlushbarPosition.TOP,
                      reverseAnimationCurve: Curves.decelerate,
                      backgroundColor: btnColor,
                      title: "Error",
                      titleColor: Colors.black,
                      titleSize: 24,
                      message: state.message,

                      duration: Duration(seconds: 6),
                      //  title:"Error",
                    ).show(context);
                    print("message");
                  }
                  // if (state is SignupError) {
                  //   // ignore: avoid_print
                  //   print(state.message);
                  //   print("4567687");
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text(state.message),
                  //       backgroundColor: Colors.red,
                  //     ),
                  //   );
                  // }
                  if (state is SignupLoaded) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                  // if(required.)
                }, builder: (context, state) {
                  if (state is SignupInitial) {
                    return InkWell(
                      child: CustomButton(
                        text: 'Sign Up',
                      ),
                      onTap: () {
                        var name = _namecontroller.text;
                        var email = _emailcontroller.text;
                        var password = _passwordcontroller.text;
                        var repassword = _repasswordcontroller.text;
                        var invitation = _invitationCodeController.text;
                        _formKey.currentState!.validate()
                            ? context.read<SignupCubit>().PostUser(
                                  _namecontroller.text,
                                  _phnumbercontroller.text,
                                  email,
                                  password,
                                  // repassword,
                                  invitation = "",
                                )
                            : CustomButton(text: "Sign up");
                      },
                    );
                  } else if (state is SignupLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: btnColor,
                    ));
                  } else
                    // ignore: curly_braces_in_flow_control_structures
                    return InkWell(
                      child: CustomButton(
                        text: 'Sign Up',
                      ),
                      onTap: () {
                        var name = _namecontroller.text;
                        var email = _emailcontroller.text;
                        var password = _passwordcontroller.text;
                        var repassword = _repasswordcontroller.text;
                        var invitation = _invitationCodeController.text;
                        context.read<SignupCubit>().PostUser(
                              _namecontroller.text,
                              _phnumbercontroller.text,
                              email,
                              password,
                              // repassword,
                              invitation = "",
                            );
                        _formKey.currentState?.validate();
                      },
                    );
                }),
                SizedBox(
                  height: 24.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Already a member? ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
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
                    )
                  ],
                ),

                // CustomContainer(
                //   image: "images/logo2.png",
                // )
                SizedBox(
                  height: 120.h,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
