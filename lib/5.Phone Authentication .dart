

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_projects/HomePage.dart';
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
    home: PhoneMain(),
  ));
}

class PhoneMain extends StatefulWidget {
  const PhoneMain({ Key? key }) : super(key: key);

  @override
  _PhoneMainState createState() => _PhoneMainState();
}

class _PhoneMainState extends State<PhoneMain> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();

  phoneAuth()async{
    await _auth.verifyPhoneNumber(
      phoneNumber: phonecontroller.text, 
      verificationCompleted: (PhoneAuthCredential credential)async{
          // var result = await _auth.signInWithCredential(credential);
          // User? user = result.user;
          // if(user!=null)
          //   {
          //     Route route =
          //             MaterialPageRoute(builder: (context) => MainPage());
          //             Navigator.push(context, route);
                   
          //   }
      },
       
      verificationFailed: (FirebaseAuthException exception)
      {
        print(exception);
      },

      codeSent: ( verificationId,[foreResendingToken])
      {
        showDialog(context: context, builder: (context){
             return Center(
               child: AlertDialog(
                 title: Text("Enter the Code"),
                 content: Column(children: [
                   TextField(
                     controller: pincontroller,
                   ),
                   RaisedButton(
                     onPressed: () async {
                       var smscode = pincontroller.text;
                       PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smscode);
                       var result = await _auth.signInWithCredential(phoneAuthCredential);
                        User? user = result.user;
                          if(user!=null)
                          {
                           Route route =
                            MaterialPageRoute(builder: (context) => MainPage());
                           Navigator.push(context, route);
                   
                           }
                     },
                     child: Text("Go"),
                     color: Colors.pink,
                   ),
                 ],
                  ),
              
               
               ),
             );
            }
          );
      },
      
      codeAutoRetrievalTimeout: (verificationId){},
      timeout: const Duration(seconds: 30)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Authentication"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
               //  keyboardType:TextInputType.number ,
                 controller: phonecontroller,
                 decoration: InputDecoration(
                 label: const Text("Phone"),
                 hintText:"Enter your phone number",
                 border:
                       OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                       prefixIcon: const Icon(Icons.phone,color: Colors.blue,),  
        
                ),
                //  
            ),
          ),

          RaisedButton(onPressed:(){
            phoneAuth();
          },
           child: Text("Enter"),
           color: Colors.yellow[600],
          )
        ],
      ),
    );
  }
}