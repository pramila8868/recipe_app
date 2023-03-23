import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/recipe/presentation/cubit/tabbar_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';
import 'foodList.dart';

class RecipeListBar extends StatefulWidget {
  const RecipeListBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecipeListBarState createState() => _RecipeListBarState();
}

class _RecipeListBarState extends State<RecipeListBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarCubit, TabbarState>(
      builder: (context, currentIndex) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              labelStyle: const TextStyle(
                  //fontWeight: FontWeight.w500,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
              //  /labelStyle: ,
              //  labelColor: Colors.black,
              // labelColor: text1,

              labelColor: const Color.fromRGBO(18, 18, 18, 1),
              unselectedLabelColor: Color.fromRGBO(151, 162, 176, 1),

              // unselectedLabelColor: Colors.red,
              isScrollable: true, //false,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: const Color.fromRGBO(226, 62, 62, 1),

              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const Tab(
                  text: 'All',
                ),
                const Tab(
                  text: 'Eggs',
                ),
                const Tab(
                  text: 'Bread',
                ),
                const Tab(
                  text: 'Pasta',
                ),
                const Tab(
                  text: 'Milk',
                ),
                const Tab(
                  text: 'Tomato',
                ),
              ],
              onTap: (index) {
                context
                    .read<TabBarCubit>()
                    .selectTab(index); //.changeTab(index);
                _tabController.animateTo(index);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: double.infinity,
                height: 224.h,
                //height: MediaQuery.of(context).size.height * 0.06.h,
                // color: Colors.blue, //Color.fromRGBO(241, 241, 241, 1),

                child: TabBarView(
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: FoodListPage(),
                    ),
                    const Center(
                      child: Text(
                        ' No Events',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Text(
                      ' Bread',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      ' Pasta',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      ' Milk',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      ' Tomato',
                      style: TextStyle(color: Colors.white),
                    ),
                    // const Events()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 42),
              child: Container(
                height: 42.h,
                // width: 313.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: searchRecipe),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SvgPicture.asset("images/Search.svg"),
                      SizedBox(
                        width: 12.w,
                      ),
                      const Text(
                        "Find more recipes",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Metropolis",
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
      //  ),
    );
  }
}
