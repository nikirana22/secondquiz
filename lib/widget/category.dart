import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  int index;
  Color firstColor;
  Color secondColor;
  String categoryName;
  IconData icon;
  String image;

  Category(
      {Key? key,
      required this.icon,
      required this.index,
      required this.firstColor,
      required this.secondColor,
        required this.image,
      required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 150,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [firstColor, secondColor]),
            borderRadius: BorderRadius.circular(30)),
      ),
      Positioned(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(opacity: 1,

                  fit: BoxFit.cover,
                  image: AssetImage(

                    image,
                  ))),
        ),
        top: 0,
        right: 30,
      ),
      Positioned(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1)),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        top: 70,
        left: 50,
      ),
      Positioned(
        child: Text(
          'Level $index',
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        top: 120,
        left: 40,
      ),
      Positioned(
        child: Text(
          categoryName,
          style: const TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        top: 145,
        left: 40,
      )
    ]);
  }
}
