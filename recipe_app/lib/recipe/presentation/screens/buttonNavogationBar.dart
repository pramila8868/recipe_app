import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/widget/search.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/recipe/presentation/screens/ingredientList.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'recipeScreen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenteredBottomNavigation extends StatefulWidget {
  const CenteredBottomNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CenteredBottomNavigationState createState() =>
      _CenteredBottomNavigationState();
}

class _CenteredBottomNavigationState extends State<CenteredBottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const RecipeScreen(),
    const Search(),
    const IngredientList()
    // const LoginScreen(),
    //const Search(),

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
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 83.h,
          decoration: const BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
                const SizedBox(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: floatingColor,
        child: //Image.asset("images/floatingbutton.jpg"),
            // child:
            SvgPicture.asset(
          "images/headchief.svg",
          color: Colors.white,
          //button,
          fit: BoxFit.cover,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
