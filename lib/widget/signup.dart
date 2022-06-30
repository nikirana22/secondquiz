import 'package:flutter/material.dart';

class Signup extends StatelessWidget{
  double? height;

  Signup({Key? key}) : super(key: key);//todo how var works in dart why we don't need to use (late and ?) with var
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;

    return   Stack(
        alignment:Alignment.topCenter,children: [
          Container(
          width: MediaQuery.of(context).size.width*0.69,
          height: height! * 0.40,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Colors.black,),
                  label: Text('Name'),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined,color: Colors.black,),
                    label: Text('Email Adress')),
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon:Icon(Icons.remove_red_eye_rounded,color: Colors.black,),

                  icon: Icon(Icons.lock,color: Colors.black,),
                  label: Text('Password'),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon:Icon(Icons.remove_red_eye_rounded,color: Colors.black,),

                  icon: Icon(Icons.lock,color: Colors.black,),
                  label: Text('Confermation'),
                ),
              ),
            ],
          ),
        ),
      // ),

      Positioned(
        top: MediaQuery.of(context).size.height*0.39,
        child:
        Container(
            width: 160,
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
                  'SIGN UP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )
            // )
        ),
      ),)
    ]);

  }
}