import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/recipe/presentation/cubit/tabbar_cubit.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.6.h,
            ),
            Container(
              height: 264.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/image35.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 24),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: detailTextColor,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: RichText(
                      //   textAlign: TextAlign.start,
                      text: TextSpan(
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 245, 0, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: "Metropolis",
                          ),
                          children: [
                            TextSpan(
                              text: "12 ",
                              style: TextStyle(
                                  fontSize: 18, color: detailTextColor),
                            ),
                            const TextSpan(
                              text: "Ingredients",
                              // style: TextStyle(color: recipeColor),
                            ),
                            TextSpan(
                              text: "15 ",
                              style: TextStyle(
                                  fontSize: 18, color: detailTextColor),
                            ),
                            const TextSpan(
                              text: "Minutes",
                              // style: TextStyle(color: recipeColor),
                            ),
                            TextSpan(
                              text: "20",
                              style: TextStyle(
                                  fontSize: 18, color: detailTextColor),
                            ),
                            const TextSpan(
                              text: "Times Cooked",
                              // style: TextStyle(color: recipeColor),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Spicy Arrabiata Pasta",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(18, 18, 18, 1),
                      fontFamily: "Metropolis",
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 46),
                    child: Text(
                      "A simple and fast pasta recipe with a subtle touch of spiceness. Easy to prepare, and perfect for your afternoon meal",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ingredients",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(18, 18, 18, 1),
                              fontFamily: "Metropolis",
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          const Text(
                            "0/12 ITEMs", // another fontfamily
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(18, 18, 18, 0.75),
                              fontFamily: "Metropolis",
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 90.w,
                      ),
                      Column(
                        children: [
                          const Text(
                            "10",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(39, 45, 47, 0.5),
                              fontFamily: "Metropolis",
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Text(
                            "SHOPPING", // font family change
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(18, 18, 18, 0.75),
                              fontFamily: "Metropolis",
                            ),
                          )
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.black, //color of divider
                        width: 10, //width space of divider
                        thickness: 3, //thickness of divier line
                        indent: 10, //Spacing at the top of divider.
                        endIndent: 10, //Spacing at the bottom of divider.
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        children: [
                          const Text(
                            "10",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(39, 45, 47, 0.5),
                              fontFamily: "Metropolis",
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Text(
                            "SERVINGS", // font family change
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(18, 18, 18, 0.75),
                              fontFamily: "Metropolis",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 46),
                    child: Container(
                      height: 2.h,
                      color: const Color.fromRGBO(3, 4, 4, 0.247),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<TabBarCubit, TabbarState>(
                builder: (context, currentIndex) {
              return Column(
                children: [
                  TabBar(
                    indicator: BoxDecoration(color: Colors.blue),
                    labelColor: const Color.fromRGBO(18, 18, 18, 1),
                    unselectedLabelColor:
                        const Color.fromRGBO(151, 162, 176, 1),
                    
                    // unselectedLabelColor: Colors.red,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: const Color.fromRGBO(226, 62, 62, 1),

                    controller: _controller,
                    tabs: const [
                      Tab(
                        text: "Ingredients",
                      ),
                      Tab(
                        text: "Direction",
                      )
                    ],
                    onTap: (index) {
                      context
                          .read<TabBarCubit>()
                          .selectTab(index); //.changeTab(index);
                      _controller.animateTo(index);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      width: double.infinity,
                      height: 124.h,
                      //height: MediaQuery.of(context).size.height * 0.06.h,
                      color: const Color.fromRGBO(241, 241, 241, 1),

                      child: TabBarView(
                        controller: _controller,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          //          ListView.builder(
                          // physics: BouncingScrollPhysics(),
                          // shrinkWrap: true,
                          // itemCount: deposite.length,
                          // itemBuilder: (context, index) => Card(
                          //       child: Container(
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Row(
                          //               children: [
                          //                 Text(deposite[index].text),
                          //                 SizedBox(
                          //                   width: MediaQuery.of(context).size.width *
                          //                       0.009.w,
                          //                 ),
                          //                 Text(deposite[index].cash)
                          //               ],
                          //             ),
                          //             Text(deposite[index].text1),
                          //             Text(deposite[index].text2)
                          //           ],
                          //         ),
                          //       ),
                          //     )),
                          // ignore: prefer_const_constructors
                          Text("Ingredients"),
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

                  //  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
