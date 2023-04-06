import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/recipe/data/model/directionModel.dart';
import 'package:recipe_app/recipe/data/model/ingredientsModel.dart';
import 'package:recipe_app/recipe/presentation/cubit/tabbar_cubit.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';
import 'package:recipe_app/recipe/presentation/widget/tabBar.dart';

import '../widget/customButton.dart';

class RecipeDetail extends StatefulWidget {
  RecipeDetail({super.key});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail>
    with SingleTickerProviderStateMixin {
  final List<String> tabList = [
    "Ingreditions",
    "Direction",
  ];
  bool _value = false;
  bool _isChecked = false;
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

  List<DirectionModel> directionModel = [
    DirectionModel(
      mainTitle: "Preheat the Grill",
      description:
          "Line a baking tray with foil & place the cherry tomatoes & red peppers on it cut side up with a drizzle of oil over the top. Place the tray under the grill for 10-12 minutes or until they’ve gone a little crisp and golden. Once cooked set them aside. Cooking them in this way enhances the sweetness and all round flavour.",
    ),
    DirectionModel(
      mainTitle: "Preheat the Grill",
      description:
          "Line a baking tray with foil & place the cherry tomatoes & red peppers on it cut side up with a drizzle of oil over the top. Place the tray under the grill for 10-12 minutes or until they’ve gone a little crisp and golden. Once cooked set them aside. Cooking them in this way enhances the sweetness and all round flavour.",
    ),
    DirectionModel(
      mainTitle: "Preheat the Grill",
      description:
          "Line a baking tray with foil & place the cherry tomatoes & red peppers on it cut side up with a drizzle of oil over the top. Place the tray under the grill for 10-12 minutes or until they’ve gone a little crisp and golden. Once cooked set them aside. Cooking them in this way enhances the sweetness and all round flavour.",
    ),
  ];

  List<IngredientsModel> ingredientsModel = [
    IngredientsModel(
      foodName: "Peeled boiled egg",
      image: item1,
      itemNumber: "6 pcs",
      isChecked: false,
    ),
    IngredientsModel(
        foodName: "Mayonnaise",
        image: item2,
        itemNumber: "1/4cup",
        isChecked: false),
    IngredientsModel(
        foodName: "Lemon juice",
        image: item3,
        itemNumber: "1tbsp",
        isChecked: false),
    IngredientsModel(
        foodName: "Yellow mustard",
        image: item4,
        itemNumber: "1tbsp",
        isChecked: false),
    IngredientsModel(
        foodName: "Salt",
        image: item5,
        itemNumber: "1/4tbsp",
        isChecked: false),
    IngredientsModel(
        foodName: "Pepper",
        image: item6,
        itemNumber: "1/4 tbsp",
        isChecked: false),
    IngredientsModel(
        foodName: "chopped celery",
        image: item7,
        itemNumber: "60g",
        isChecked: false),
    IngredientsModel(
        foodName: "slicedgreen onions",
        image: item8,
        itemNumber: "18g",
        isChecked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(context);
                        //     .pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (context) => const TabBarPage()),
                        // );
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: detailTextColor,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              "12 ",
                              style: TextStyle(
                                  fontFamily: "Metropolis",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: detailTextColor),
                            ),
                            const Text(
                              "Ingredients",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 245, 0, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Metropolis",
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const VerticalDivider(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              //color of divider
                              width: 16,
                              thickness: 2,
                            ),
                            Text(
                              "15 ",
                              style: TextStyle(
                                  fontFamily: "Metropolis",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: detailTextColor),
                            ),
                            const Text(
                              "Minutes",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 245, 0, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Metropolis",
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const VerticalDivider(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 16,
                              thickness: 2, //thickness of divier line
                            ),
                            Text(
                              "20 ",
                              style: TextStyle(
                                  fontFamily: "Metropolis",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: detailTextColor),
                            ),
                            const Text(
                              "Times Cooked",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 245, 0, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: "Metropolis",
                              ),
                            ),
                          ],
                        ),
                      )
                      //   child: RichText(
                      //     //   textAlign: TextAlign.start,
                      //     text: TextSpan(
                      //         style: const TextStyle(
                      //           color: Color.fromRGBO(255, 245, 0, 1),
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 12,
                      //           fontFamily: "Metropolis",
                      //         ),
                      //         children: [
                      //           TextSpan(
                      //             text: "12 ",
                      //             style: TextStyle(
                      //                 fontSize: 18, color: detailTextColor),
                      //           ),
                      //           const TextSpan(
                      //             text: "Ingredients",
                      //             // style: TextStyle(color: recipeColor),
                      //           ),
                      //           TextSpan(
                      //             text: "15 ",
                      //             style: TextStyle(
                      //                 fontSize: 18, color: detailTextColor),
                      //           ),
                      //           const TextSpan(
                      //             text: "Minutes",
                      //             // style: TextStyle(color: recipeColor),
                      //           ),
                      //           TextSpan(
                      //             text: "20",
                      //             style: TextStyle(
                      //                 fontSize: 18, color: detailTextColor),
                      //           ),
                      //           const TextSpan(
                      //             text: "Times Cooked",
                      //             // style: TextStyle(color: recipeColor),
                      //           ),
                      //         ]),
                      //   ),
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
                    "Spicy Arrabiata Pasta ",
                    //softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Color.fromRGBO(39, 45, 47, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
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
                              "0/12 ITEMS", // another fontfamily
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(18, 18, 18, 0.75),
                                fontFamily: "Red Hat Text",
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
                                fontFamily: "Red Hat Text",
                              ),
                            )
                          ],
                        ),
                        const VerticalDivider(
                          color: Color.fromRGBO(39, 45, 47, 0.5),
                          //color of divider
                          width: 31,
                          thickness: 2,
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
                                fontFamily: "Red Hat Text",
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
                    padding: const EdgeInsets.only(right: 16),
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
                      color: const Color.fromRGBO(226, 62, 62, 1),
                      // color: Colors.blue,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color.fromRGBO(226, 62, 62, 1),
                    // unselectedLabelColor: Colors.red,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.tab,
                    // indicatorColor: const Color.fromRGBO(226, 62, 62, 1),

                    controller: _controller,
                    tabs: List.generate(
                      tabList.length,
                      (index) => Tab(text: tabList[index]),
                    ),
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
                      color: const Color.fromRGBO(241, 241, 241, 1),
                      child: TabBarView(
                        controller: _controller,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          //  Text(""),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: ingredientsModel.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          const Color.fromRGBO(
                                                              254,
                                                              254,
                                                              254,
                                                              1)),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 11),
                                                        child: Image.asset(
                                                            ingredientsModel[
                                                                    index]
                                                                .image

                                                            //color: Colors.black,
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        ingredientsModel[index]
                                                            .foodName,
                                                        softWrap: true,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 11,
                                                            fontFamily:
                                                                "Metropolis"),
                                                      ),
                                                      const Expanded(
                                                          child: SizedBox()),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 24.5),
                                                        child: Text(
                                                          ingredientsModel[
                                                                  index]
                                                              .itemNumber,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 11,
                                                              fontFamily:
                                                                  "Metropolis"),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),

                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  ingredientsModel[index]
                                                          .isChecked =
                                                      !ingredientsModel[index]
                                                          .isChecked;
                                                  //  _isChecked = !_isChecked;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 46),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: ingredientsModel[
                                                                index]
                                                            .isChecked //_isChecked
                                                        ? const Color.fromRGBO(
                                                            226, 62, 62, 1)
                                                        : null,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      width: 2.0,
                                                      color:
                                                          const Color.fromRGBO(
                                                              226, 62, 62, 1),
                                                      // color: _isChecked
                                                      //     ? Colors.white
                                                      //     : Colors.grey.shade400,
                                                    ),
                                                  ),
                                                  child: ingredientsModel[index]
                                                          .isChecked //_isChecked
                                                      ? const Icon(
                                                          Icons.check,
                                                          size: 16.0,
                                                          color: Colors.white,
                                                        )
                                                      : null,
                                                ),
                                              ),
                                            ),

                                            // const CustomButton(),
                                          ],
                                        );
                                      }),
                                ),
                                //const Expanded(child: SizedBox()),
                                // const Padding(
                                //   padding: EdgeInsets.only(left: 24, right: 26),
                                //   child: CustomButton(),
                                // ),
                                SizedBox(
                                  height: 40.h,
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
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
                                  directionDetail(),
                                ],
                              ),
                            ),
                          )
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
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(241, 241, 241, 1),
        child: const Padding(
          padding: EdgeInsets.only(left: 24, right: 26, bottom: 40),
          child: CustomButton(),
        ),
      ),
    );
  }

  Widget directionDetail() {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          //  physics: const NeverScrollableScrollPhysics(),
          itemCount: directionModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: Container(
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
                        directionModel[index].mainTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                        directionModel[index].description,
                        style: const TextStyle(
                          color: Color.fromRGBO(39, 45, 47, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
