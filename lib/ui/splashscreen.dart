import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greenmindsfyp/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: Center(
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('GREEN' ,style: TextStyle(fontWeight: FontWeight.w700,fontSize:70,color: Colors.white,letterSpacing:10)),
                Text('MINDS' ,style: TextStyle(fontWeight: FontWeight.w400,fontSize:70,color: Colors.white,letterSpacing:20)),
                Image(image: AssetImage('images/groot.png'),height: 400,width: 500,),

              ],
            )
        ),
      ),
    );
  }
}
