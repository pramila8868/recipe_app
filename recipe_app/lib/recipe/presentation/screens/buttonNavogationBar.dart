import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/Widget/search.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'recipeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenteredBottomNavigation extends StatefulWidget {
  @override
  _CenteredBottomNavigationState createState() =>
      _CenteredBottomNavigationState();
}

class _CenteredBottomNavigationState extends State<CenteredBottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    RecipeScreen(),
    Search(),
    LoginScreen(),
    // SignUpScreen(),
  ]; // Add your pages here  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,

      // backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 8,
          // color: Colors.green,
          //  elevation: 0.0,
          // surfaceTintColor: Colors.red,

          // shape: AutomaticNotchedShape(RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(30)))),
          shape: const CircularNotchedRectangle(),

          //  clipBehavior: Clip.none,
          // shape: AutomaticNotchedShape(

          //     // StadiumBorder(),
          //     ),

          child: Container(
            height: 83.h,
            decoration: const BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 23.5, right: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: //Icon(Icons.home),
                        SvgPicture.asset(
                      icon1,
                      color: _selectedIndex == 0 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(0);
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      icon2,
                      color: _selectedIndex == 1 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(1);
                    },
                  ),
                  SizedBox(
                    width: 48.0,
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      icon3,
                      color: _selectedIndex == 2 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(2);
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      icon4,
                      color: _selectedIndex == 3 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 120,
        width: 56,
        //width: 105,dec
        // child: Material(
        //  color: Colors.transparent,
        child: FloatingActionButton(
          onPressed: () {},

          //  Icon(Icons.add)
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            button,
            fit: BoxFit.cover,
          ),
        ),
        //  ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
