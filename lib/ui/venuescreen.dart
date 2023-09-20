import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenmindsfyp/ui/auth/login_screen.dart';

import '../utils/utils.dart';

class VenueScreen extends StatelessWidget {
   VenueScreen({Key? key}) : super(key: key);

  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green.shade800,
      title: Text('Pick a venue',style: TextStyle(fontSize: 20 ,letterSpacing: 1),),
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          auth.signOut().then((value){Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
          }).onError((error, stackTrace){utils().toastMessage(error.toString());});
        }, icon: Icon(Icons.logout_outlined),),
      SizedBox(width:10)
      ],
    ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: GridView.count(

                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                  physics: ScrollPhysics(),
                  children: [Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(7.0,7.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Column(
                        children: [Image(image: AssetImage('images/livingroom.png')),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                            Text('Living room',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                Icon(Icons.arrow_circle_right,color: Colors.green.shade800,size:35,)
                              ]
                            ),
                          )
                        ],
                      ),


                  ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(7.0,7.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(17.0)
                      ),
                      child: Column(
                        children: [Image(image: AssetImage('images/classroom.png')),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Text('Classroom',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                  Icon(Icons.arrow_circle_right,color: Colors.green.shade800,size:35,)
                                ]
                            ),
                          )
                        ],
                      ),


                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(7.0,7.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(17.0)
                      ),
                      child: Column(
                        children: [Image(image: AssetImage('images/bedroom.png')),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Text('Bedroom',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                  Icon(Icons.arrow_circle_right,color: Colors.green.shade800,size:35,)
                                ]
                            ),
                          )
                        ],
                      ),


                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(7.0,7.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(17.0)
                      ),
                      child: Column(
                        children: [Image(image: AssetImage('images/office.png')),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Text('Office',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                  Icon(Icons.arrow_circle_right,color: Colors.green.shade800,size:35,)
                                ]
                            ),
                          )
                        ],
                      ),


                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(7.0,7.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(17.0)
                      ),
                      child: Column(
                        children: [Image(image: AssetImage('images/patio.png')),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Text('Patio',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                  Icon(Icons.arrow_circle_right,color: Colors.green.shade800,size:35,)
                                ]
                            ),
                          )
                        ],
                      ),


                    )


                  ]
              ),
            )
          ],

        ),
      )
    );
  }
}
