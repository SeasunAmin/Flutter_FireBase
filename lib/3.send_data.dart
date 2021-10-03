import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  runApp(MaterialApp(
    title: "seasun",
    theme: ThemeData(primarySwatch: Colors.teal),
    showSemanticsDebugger: false,
    home:Data()
  ));
}
class Data extends StatefulWidget {
  const Data({ Key? key }) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
 
 Future sent ()async{
  final db = FirebaseFirestore.instance.collection("Information's").add({
    
    'name':'Seasun',
    'age':'22',
    'dept':'CSE',
   
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FloatingActionButton(onPressed: sent,
          child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}