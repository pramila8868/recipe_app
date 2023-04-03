import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/widget/search.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
<<<<<<< HEAD
import 'package:recipe_app/recipe/presentation/screens/ingredientList.dart';
=======
import 'package:recipe_app/recipe/presentation/screens/exploreScreen.dart';
import 'package:recipe_app/recipe/presentation/screens/signOut.dart';
>>>>>>> b1c283b222290606a6e727cd17c55ba56258ece9
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
<<<<<<< HEAD
    const IngredientList()
    // const LoginScreen(),
    //const Search(),

    // SignUpScreen(),
=======
    SignOut(),
    //ExploreScreen(),
    const Search(),
>>>>>>> b1c283b222290606a6e727cd17c55ba56258ece9
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
<<<<<<< HEAD
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
=======
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
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
                      // ignore: deprecated_member_use
                      color: _selectedIndex == 0 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(0);
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      icon2,
                      // ignore: deprecated_member_use
                      color: _selectedIndex == 1 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(1);
                    },
>>>>>>> b1c283b222290606a6e727cd17c55ba56258ece9
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
<<<<<<< HEAD
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
=======
                  IconButton(
                    icon: SvgPicture.asset(
                      icon3,
                      // ignore: deprecated_member_use
                      color: _selectedIndex == 2 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(2);
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      icon4,
                      // ignore: deprecated_member_use
                      color: _selectedIndex == 3 ? buttonColor : searchRecipe,
                    ),
                    onPressed: () {
                      _onItemTapped(3);
                    },
                  ),
                ],
              ),
>>>>>>> b1c283b222290606a6e727cd17c55ba56258ece9
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
<<<<<<< HEAD
=======
          // ignore: deprecated_member_use
>>>>>>> b1c283b222290606a6e727cd17c55ba56258ece9
          color: Colors.white,
          //button,
          fit: BoxFit.cover,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
