import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenmindsfyp/ui/auth/login_screen.dart';
import 'package:greenmindsfyp/ui/boardingscreen.dart';
import 'package:greenmindsfyp/utils/utils.dart';
import 'package:greenmindsfyp/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool loading = false ;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

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
    _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()

    ).then((value){
      emailController.clear();
      passwordController.clear();
      utils().toastSuccess('Account created successfully');
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace){
      utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(

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

                    SizedBox(height: 30,),
                    RoundButton(title: 'Sign up',
                      loading: loading,
                      onTap: (){
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
                          child: Text("Already have an account?",style: TextStyle(fontSize: 12,color: Colors.black),
                          ),
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen())
                          );
                        },
                            child: Text("Login",style: TextStyle( fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black)))
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
