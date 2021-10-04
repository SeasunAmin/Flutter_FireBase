import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_projects/1.main.dart';
import 'package:firebase_projects/Sinup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
async{
  {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  runApp(MaterialApp(
    title: "seasun",
    theme: ThemeData(
      primarySwatch: Colors.teal
    ),
    home: const EmailVal(),
  ));
}
class EmailVal extends StatefulWidget {
  const EmailVal({ Key? key }) : super(key: key);

  @override
  _EmailValState createState() => _EmailValState();
}

class _EmailValState extends State<EmailVal> {

   final _auth = FirebaseAuth.instance;
   var email;
   var password;
   var user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
               Image.asset("assets/talk.png",height: 250,width: double.infinity,),
               const Text("Welcome to login page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                    onChanged: (value){
                      email=value;
                    },
                   
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
                    onChanged: (value){
                      setState(() {
                        password = value;
                      });
                    },
                      
                     
                    ),
                  ),

                  RaisedButton(
                    child: Text("Login"),
                    onPressed: (){},
                    color: Colors.green,
                  ),
                  TextButton(
                  onPressed:(){
                    Route route =
                      MaterialPageRoute(builder: (context) => SignUp());
                  Navigator.push(context, route);
                   
                  }, 
                  
                  child: Text("Don't have account? SignUp."),
                
                )
    
            ],
          )
        ],
      ),
    );
  }
}