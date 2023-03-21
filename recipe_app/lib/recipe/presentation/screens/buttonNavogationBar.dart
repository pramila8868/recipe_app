import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'recipeScreen.dart';

class CenteredBottomNavigation extends StatefulWidget {
  @override
  _CenteredBottomNavigationState createState() =>
      _CenteredBottomNavigationState();
}

class _CenteredBottomNavigationState extends State<CenteredBottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    RecipeScreen(),
    LoginScreen(),
    SignUpScreen(),
  ]; // Add your pages here  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset(icon1),
                color: _selectedIndex == 0 ? buttonColor : Colors.black,
                //Icon(Icons.home),
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(icon2),
                color: _selectedIndex == 1 ? Colors.white : buttonColor,
                onPressed: () {
                  _onItemTapped(1);
                },
              ),
              SizedBox(
                width: 48.0,
              ),
              IconButton(
                icon: SvgPicture.asset(icon3),
                color: _selectedIndex == 2 ? buttonColor : Colors.white,
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(icon4),
                color: _selectedIndex == 3 ? buttonColor : Colors.white,
                onPressed: () {
                  _onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(button),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
