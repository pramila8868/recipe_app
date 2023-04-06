import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/recipe/presentation/cubit/tabbar_cubit.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail>
    with SingleTickerProviderStateMixin {
  bool _value = false;
  confirmIngredient() {
    _value = !_value;
  }

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
        child: SingleChildScrollView(
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
                      // child:Row(children: [
                      //   Text( "12 ",
                      //           style: TextStyle(
                      //               fontSize: 18, color: detailTextColor),
                      //         ),
                      //         Text( "Ingredients",),
                      // ],)
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    IntrinsicHeight(
                      child: Row(
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
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("images/image13.svg"),
                                  SizedBox(
                                    width: 6.92.w,
                                  ),
                                  SvgPicture.asset("images/image14.svg"),
                                ],
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
                            color: Color.fromRGBO(39, 45, 47, 0.5),
                            //color of divider
                            width: 31, //width space of divider
                            thickness: 3, //thickness of divier line
                            // indent: 10, //Spacing at the top of divider.
                            // endIndent: 10, //Spacing at the bottom of divider.
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
                    SizedBox(
                      height: 20.h,
                    ),
                    TabBar(
                      padding: const EdgeInsets.only(right: 91),
                      // labelPadding: EdgeInsets.only(left: 17, right: 30),
                      indicatorPadding:
                          const EdgeInsets.only(left: 17, right: 17),
                      labelStyle: const TextStyle(
                          //fontWeight: FontWeight.w500,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                          // color: Colors.blue,
                          ),
                      labelColor: const Color.fromRGBO(18, 18, 18, 1),
                      unselectedLabelColor:
                          const Color.fromRGBO(151, 162, 176, 1),

                      // unselectedLabelColor: Colors.red,
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.tab,
                      // indicatorColor: const Color.fromRGBO(226, 62, 62, 1),

                      controller: _controller,
                      tabs: const [
                        Center(
                          child: Tab(
                            text: "Ingredients",
                          ),
                        ),
                        Center(
                          child: Tab(
                            text: "Direction",
                          ),
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
                      padding: const EdgeInsets.only(top: 22),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        // height: 300.h,
                        //height: MediaQuery.of(context).size.height * 0.06.h,
                        color: const Color.fromRGBO(241, 241, 241, 1),
                        //  color: Colors.amber,

                        child: TabBarView(
                          controller: _controller,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (item, index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 20,
                                                //  bottom: 10,
                                                left: 14),
                                            height: 64,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color.fromRGBO(
                                                    254, 254, 254, 1)),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  "foodName",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11,
                                                      fontFamily: "Metropolis"),
                                                ),
                                                Expanded(child: SizedBox()),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 24.5),
                                                  child: Text(
                                                    "itemNumber",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 11,
                                                        fontFamily:
                                                            "Metropolis"),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 46),
                                        child: InkWell(
                                          onTap: () {
                                            confirmIngredient();
                                          },
                                          child: Container(
                                              height: 25.h,
                                              width: 25.w,
                                              decoration: BoxDecoration(
                                                color: _value
                                                    ? Colors.red
                                                    : Colors.blue,
                                                // color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      226, 62, 62, 1),
                                                ),
                                              ),
                                              child: _value
                                                  ? const Icon(
                                                      Icons.check,
                                                      color: Colors.black,
                                                    )
                                                  : null),
                                        ),
                                      ),
                                    ],
                                  );
                                }),

                            //Text("Ingredients"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 17, right: 31),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const Text(
                                    "Steps",
                                    style: TextStyle(
                                        color: Color.fromRGBO(18, 18, 18, 1),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 28.h,
                                  ),
                                  directionDetail(
                                    "1. Preheat the Grill",
                                    " Line a baking tray with foil & place the cherry tomatoes & red peppers on it cut side up with a drizzle of oil over the top. Place the tray under the grill for 10-12 minutes or until they’ve gone a little crisp and golden. Once cooked set them aside. Cooking them in this way enhances the sweetness and all round flavour.",
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  directionDetail(
                                    "1. Preheat the Grill",
                                    " Line a baking tray with foil & place the cherry tomatoes & red peppers on it cut side up with a drizzle of oil over the top. Place the tray under the grill for 10-12 minutes or until they’ve gone a little crisp and golden. Once cooked set them aside. Cooking them in this way enhances the sweetness and all round flavour.",
                                  ),
                                ],
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
      ),
    );
  }

  Widget directionDetail(String text, String description) {
    return Container(
      height: 319.h,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.75),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color.fromRGBO(226, 62, 62, 1),
                  fontFamily: "Red Hat Display"),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              description,
              style: const TextStyle(
                color: Color.fromRGBO(39, 45, 47, 1),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
