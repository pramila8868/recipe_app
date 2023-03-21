import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';

import 'recipeScreen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.add),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
