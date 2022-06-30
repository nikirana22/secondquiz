import 'package:flutter/material.dart';

class Login extends StatelessWidget {
   late Size size;
  static late double height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double width =size.width;
   if (width > 600) {
      // height = width;
    } else {
      height=size.height;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          width: width,
           height: MediaQuery.of(context).size.height,
          // height * 0.34,312
        // height: 712*0.34,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment:Alignment.topCenter,
                child: Container(
                  width: width * 0.7,
                  height: height * 0.24,
                  // height: height*0.29,// todo small mobile
                  margin: EdgeInsets.only(top: height * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(11)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: const [
                      //Expanded(
                        //child:
                        TextField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                              label: Text('Email Adress')),
                        ),
                      //),

                      //Expanded(
                       // child:
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.black,
                            ),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            label: Text('Password'),
                          ),
                        ),
                      //)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * 0.23,
                left: width *0.23,

                child: Container(
                    width: width * 0.45,
                    height: height * 0.06,

                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(243, 73, 136, 1),
                              offset: Offset(3, 5),
                              spreadRadius: 1,
                              blurRadius: 15),
                          BoxShadow(
                            color: Color.fromRGBO(245, 162, 104, 1),
                          )
                        ],
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(243, 73, 136, 1),
                          Color.fromRGBO(245, 162, 104, 1),
                        ])),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ))),
              ),
            ],
          ),
        ),
        const Text('Forgot Password ?',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          height: height * 0.02,
          width: width * 0.4,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Expanded(
                child: Divider(
                  thickness: 0.9,
                  color: Colors.white,
                ),
              ),
              Text('Or',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: Divider(
                  thickness: 0.9,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.06,
              width: height * 0.06,
              // height: height*0.085,//todo small mobile

              padding: const EdgeInsets.all(10),
              child: const FittedBox(
                child: Icon(
                  Icons.facebook,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: height * 0.06,
              width: height * 0.06,
              // height: height*0.085,//todo small mobile
              padding: const EdgeInsets.all(10),
              child: const FittedBox(
                child: Icon(
                  Icons.mail,
                  color: Colors.blue,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
            ),
          ],
        )
      ],
    );
  }
//TODO: Test for multiple screen sizes
}
