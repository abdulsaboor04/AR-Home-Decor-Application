import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenmindsfyp/ui/auth/signup_screen.dart';
import 'package:greenmindsfyp/utils/utils.dart';
import 'package:greenmindsfyp/widgets/round_button.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../boardingscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool loading = false;
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final _formKey = GlobalKey<FormState>();

 final _auth = FirebaseAuth.instance;

 @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
  }


  void login(){
   setState(() {
     loading = true;
   });
   _auth.signInWithEmailAndPassword(
       email: emailController.text,
       password: passwordController.text.toString()
   ).then((value){
          emailController.clear();
          passwordController.clear();
         Navigator.push(context, MaterialPageRoute(builder: (context) => BoardingScreen()));
          setState(() {
            loading = false;
          });
   }).onError((error, stackTrace){
     utils().toastMessage(error.toString());
   });
   setState(() {
     loading = false;
   });
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      child: WillPopScope(
        onWillPop: ()async{
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green.shade800,
            title: Center(child: Text("Green Minds",style: TextStyle(fontSize: 20,letterSpacing: 1),)),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/loginbg.png"),
                  fit: BoxFit.cover),
            ),
            child: Center(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green.shade100.withOpacity(0.8)),

                  padding: EdgeInsets.symmetric(horizontal: 20),

            constraints: BoxConstraints(maxHeight: 500,),


                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration:   InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide( color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),),
                                    hintText: 'Email', hintStyle: TextStyle(color: Colors.black),
                                    fillColor: Colors.white,
                                    filled: true,

                                    prefixIcon: Icon(Icons.alternate_email_sharp,color:Colors.black),

                                ),
                                validator: (value){
                                  if (value!.isEmpty){
                                    return 'Enter email';
                                  }
                                  return null;
                                },


                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                obscureText: true,
                                decoration:  InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:BorderSide( color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),),
                                    hintText: 'Password', hintStyle: TextStyle(color: Colors.black),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(Icons.lock_open_sharp,color: Colors.black,)
                                ),
                                validator: (value){
                                  if (value!.isEmpty){
                                    return 'Enter password';
                                  }
                                  return null;
                                },

                              ),

                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Forgot your password?',style: TextStyle( fontSize: 12,color: Colors.black, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      RoundButton(title: 'Login',
                          loading: loading
                           ,onTap: (){
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_formKey.currentState!.validate()){
                          login();
                        }
                      },),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Or',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children:[
                              Image(image: AssetImage('images/google.png'),height: 25, width: 25  ),
                              SizedBox(width:40,),
                              Text('Continue with Google',style: TextStyle(fontSize: 15,color: Colors.black),),]
                            )]
                        )

              ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Dont't have an account?",style: TextStyle( fontSize: 12,color: Colors.black),
                            ),
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen())
                            );
                          },
                              child: Text("Sign up",style: TextStyle( fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black)))
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
