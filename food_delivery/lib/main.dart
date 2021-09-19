import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/constraints.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 50),
              child: Align(
                  alignment: Alignment.topRight,
                  child:
                      SvgPicture.asset("assets/icons/menu.svg", height: 11))),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Simple way of finding \nTasty food",
                  style: Theme.of(context).textTheme.headline1)),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
                children: [
                  foodCard(
                      title: "Vegan Salad Bowl",
                      image: "assets/images/image_1.png",
                      price: 20,
                      calories: "420Kcal",
                      description:
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. "),
                  // foodCard(),
                  SizedBox(width: 20)
                ],
              ))
        ]));
  }
}

class foodCard extends StatelessWidget {
  final String title;
  final String ingredient;
  final String image;
  final int price;
  final String calories;
  final String description;

  const foodCard(
      {Key? key,
      required this.title,
      required this.ingredient,
      required this.image,
      required this.price,
      required this.calories,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        height: 400,
        width: 270,
        child: Stack(children: <Widget>[
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 380,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: kPrimaryColor.withOpacity(.06)),
              )),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
                height: 181,
                width: 181,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor.withOpacity(.15))),
          ),
          Positioned(
              top: 0,
              left: -50,
              child: Container(
                  height: 184,
                  width: 276,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image))))),
          Positioned(
              top: 80,
              right: 20,
              child: Text("\$price",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: kPrimaryColor))),
          Positioned(
              top: 201,
              left: 40,
              child: Container(
                  width: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: Theme.of(context).textTheme.subtitle1),
                      Text("With $ingredient",
                          style: TextStyle(
                            color: kTextColor.withOpacity(.4),
                          )),
                      SizedBox(height: 16),
                      Text(description,
                          maxLines: 4,
                          style: TextStyle(color: kTextColor.withOpacity(.65))),
                      SizedBox(height: 16),
                      Text(calories)
                    ],
                  )))
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
