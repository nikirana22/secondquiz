import 'package:flutter/material.dart';

import '../widget/category.dart';

class CategoryScreen extends StatelessWidget{
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black87, width: 0.5),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.blue,
                size: 20,
              ),
              margin: const EdgeInsets.only(right: 15, top: 7, bottom: 7),
            ),
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black87, width: 0.5),
              ),
              child: const Icon(
                Icons.supervised_user_circle_rounded,
                color: Colors.blue,
                size: 20,
              ),
              margin: const EdgeInsets.only(right: 20, top: 7, bottom: 7),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.13,
              // color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Let\'s Play',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Be the first !')
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView(
                children: [
                  Category(
                      icon: Icons.check,
                      index: 1,
                      image: 'trave.png',
                      categoryName: 'Travel newbie',
                      firstColor: const Color.fromRGBO(237, 110, 160, 1),
                      secondColor: const Color.fromRGBO(235, 139, 110, 1)),
                  Category(
                    index: 2,
                    icon: Icons.play_arrow,
                    categoryName: 'Continuing',
                    image:'ballon.png',
                    firstColor: const Color.fromRGBO(84, 114, 236, 1),
                    secondColor: const Color.fromRGBO(5, 188, 254, 1),
                  ),
                  Category(
                    index: 3,
                    image: 'world.png',
                    icon: Icons.lock,
                    categoryName: 'Experienced',
                    firstColor: const Color.fromRGBO(165, 143, 207, 1),
                    secondColor: const Color.fromRGBO(248, 193, 234, 1),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}