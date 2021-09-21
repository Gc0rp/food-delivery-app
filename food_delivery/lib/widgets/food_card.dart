import 'package:flutter/material.dart';
import 'package:food_delivery/constraints.dart';

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
              child: Text("\$" + price.toString(),
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
