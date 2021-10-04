import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_projects/1.main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var user;
   final _auth = FirebaseAuth.instance;
   var email;
   var password;
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
                      
                     
                    ),
                  ),

                  RaisedButton(
                    child: Text("SignUp"),
                    onPressed: ()async {
                     
                      user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(user!=null)
                      {
                         Route route =
                       MaterialPageRoute(builder: (context) => HomePage());
                       Navigator.push(context, route);
                      }
                      else{
                        print("Not connect yet");
                      }
                   },   
                    color: Colors.green,
                  ),
                
    
            ],
          )
        ],
      ),
    );
  }
}