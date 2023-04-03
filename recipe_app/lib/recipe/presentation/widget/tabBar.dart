import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/recipe/presentation/cubit/tabbar_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';
import 'justForYou.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "images/headchief.svg",
                    // ignore: deprecated_member_use
                    color: recipeColor,
                  ),
                  SizedBox(
                    width: 6.43.w,
                  ),
                  Text(
                    "Food In",
                    style: TextStyle(
                        color: recipeColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        fontFamily: "Rancho"
                        //height: 30
                        ),
                  ),
                  Expanded(
                    child: TabBar(
                      labelStyle: const TextStyle(
                          //fontWeight: FontWeight.w500,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      //  /labelStyle: ,
                      //  labelColor: Colors.black,
                      // labelColor: text1,

                      labelColor: const Color.fromRGBO(18, 18, 18, 1),
                      unselectedLabelColor: const Color.fromRGBO(151, 162, 176, 1),

                      // unselectedLabelColor: Colors.red,
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: const Color.fromRGBO(226, 62, 62, 1),
                        
                      controller: _tabController,
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        const Tab(
                          text: 'Just For You',
                        ),
                        const Tab(
                          text: 'EXPLORE',
                        ),
                      ],
                      onTap: (index) {
                        context
                            .read<TabBarCubit>()
                            .selectTab(index); //.changeTab(index);
                        _tabController.animateTo(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                width: double.infinity,
                height: 124.h,
                //height: MediaQuery.of(context).size.height * 0.06.h,
                color: const Color.fromRGBO(241, 241, 241, 1),

                child: TabBarView(
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    JustForYou(),
                    const Center(
                      child: Text(
                        ' No Events',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // const Events()
                  ],
                ),
              ),
            ),
          ],
        );
      },
      //  ),
    );
  }
}
