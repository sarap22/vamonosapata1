import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/principal.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){Future.delayed(Duration(seconds: 8), (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> info()));
  });}

Widget build(BuildContext context){
  return Scaffold(
    body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(116, 199, 184, 9),
          ),
          Center(
            child: Lottie.asset('img/111638-dog-on-the-sun (1).json',height: 600, width: 600,)
          )
        ],
    )
  );
}
}