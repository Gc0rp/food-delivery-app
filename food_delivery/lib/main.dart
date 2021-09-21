// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/constraints.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/widgets/food_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: kWhiteColor,
          primaryColor: kPrimaryColor,
          textTheme: TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          padding: EdgeInsets.all(10),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: kPrimaryColor.withOpacity(.26)),
          child: Container(
              padding: EdgeInsets.all(20),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: SvgPicture.asset("assets/icons/plus.svg")),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20, top: 50),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/menu.svg",
                          height: 11))),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Simple way of finding \nTasty food",
                      style: Theme.of(context).textTheme.headline1)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      CategoryTitle(title: "All", active: true),
                      CategoryTitle(title: "Italian"),
                      CategoryTitle(title: "Asian"),
                      CategoryTitle(title: "Chinese"),
                      CategoryTitle(title: "Burgers"),
                    ],
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kBorderColor),
                  ),
                  child: SvgPicture.asset("assets/icons/search.svg")),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      foodCard(
                          title: "Vegan Salad Bowl",
                          image: "assets/images/image_1.png",
                          price: 20,
                          calories: "420Kcal",
                          description:
                              "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                          ingredient: "Tomato"),

                      foodCard(
                          title: "Vegan Salad Bowl",
                          image: "assets/images/image_2.png",
                          price: 40,
                          calories: "420Kcal",
                          description:
                              "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                          ingredient: "Tomato"),

                      // foodCard(),
                      SizedBox(width: 20)
                    ],
                  ))
            ]));
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;
  const CategoryTitle({
    Key? key,
    this.active = false,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: active ? kPrimaryColor : kTextColor.withOpacity(.4),
            ),
      ),
    );
  }
}
