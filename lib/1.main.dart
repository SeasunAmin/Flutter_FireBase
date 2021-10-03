import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "seasun",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage()
      )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
        centerTitle: true,
      ),
      body: Column(
        children: [
             
           StreamBuilder(
             stream: FirebaseFirestore.instance.collection("Programing Language").snapshots(),
             builder: (BuildContext context, AsyncSnapshot snapshot)
             {
                return Text("${snapshot.data.doc[0]['name']}");
             },
           )
           
        ],
      ),
    );
  }
}
        
   