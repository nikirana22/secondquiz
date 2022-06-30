import 'package:flutter/material.dart';
import 'package:quiz/widget/login.dart';
import 'package:quiz/widget/signup.dart';


class LoginHome extends StatelessWidget{
  late Size size;
  static double? portraitHeight;
  static double? portraitwidth;

  LoginHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    print('$height $width');

    if (width > 600) {
      height = width;
    } else {
      portraitHeight = height;
      portraitwidth = width;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(245, 162, 104, 1),
                  Color.fromRGBO(243, 73, 136, 1)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Image.asset(
                  'enjoy.png',
                  height: height * 0.25,
                  width: double.infinity,
                ),
                Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(30)),
                  width: width * 0.75,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    tabs: const [
                      Tab(
                        text: 'Existing',
                      ),
                      Tab(text: 'New')
                    ],
                    padding: const EdgeInsets.all(7),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    height: height * 0.63,
                    child: TabBarView(children: [
                      Login(),
                      Signup(),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

}