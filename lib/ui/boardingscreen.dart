import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'introscreen.dart';



class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image(image: AssetImage('images/onboarding.jpg'),width: double.infinity,height: double.infinity,
                fit: BoxFit.fill,),
              ClipPath(

                clipper: WaveClipperTwo(reverse: true),
                child: Container(
                  height: 300,
                  color: Colors.green.shade900,
                  child: Center(child: Text("Place before\nyou purchase",style: TextStyle(fontWeight: FontWeight.w700,fontSize:25,color: Colors.white),)),
                ),
              ),
              Positioned(
                  bottom: 40,
                  child:SizedBox(

                      width: 170, // <-- Your width
                      height: 50, // <-- Your height
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade800,
                          shadowColor: Colors.black,
                          elevation: 30),onPressed: (){Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => SliderScreen())
                      );},
                          child: Text('Get Started',style: TextStyle(fontSize: 20),)))
              )

            ],
          )
      ),
    );
  }
}
