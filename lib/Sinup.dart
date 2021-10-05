import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/1.main.dart';
import 'package:firebase_projects/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   var email;
   var password;

  register()async{
       
       final User?  user =(await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
       if (user!=null) 
       {
          Route route =
                       MaterialPageRoute(builder: (context) => MainPage());
                       Navigator.push(context, route);
                       print("yea bro success!!");
       }
       else
       {
         print("Bro you got Error...!");
       }
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
               Image.asset("assets/go.png",height: 250,width: double.infinity,),
               const Text("Welcome to SignUp page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: TextField(
                    decoration: InputDecoration(
                      label: const Text("Email"),
                      hintText:"Enter your email address",
                       border:
                     OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                     prefixIcon: const Icon(Icons.account_circle,color: Colors.blue,),  
                  ),
                    onChanged: (value)
                    {
                      email = value;
                    }
                   
                  ),
                  
                 ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        
                        label: const Text("Password"),
                        hintText:"Enter your Password",
                         border:
                       OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                       prefixIcon: const Icon(Icons.pin_rounded,color: Colors.blue,),  
                    ),
                      onChanged: (value)
                      {
                        password=value;
                      }
                     
                    ),
                  ),

                  RaisedButton(
                    child: Text("SignUp"),
                    onPressed: register,
                     
                    color: Colors.green,
                  ),
                
            ],
          )
        ],
      ),
    );
  }
}