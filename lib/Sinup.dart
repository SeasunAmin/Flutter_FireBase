import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SinUp extends StatefulWidget {
  const SinUp({ Key? key }) : super(key: key);

  @override
  _SinUpState createState() => _SinUpState();
}

class _SinUpState extends State<SinUp> {

  var fromKey = GlobalKey<FormState>();

  var email = TextEditingController();
  var pass = TextEditingController();
  

  var Email, Pass, Phn;

  void handleSubmit() {
    if (fromKey.currentState!.validate()) {
      fromKey.currentState!.save();
      print("Email : ${this.Email}");
      print("Passwors ${this.Pass}");
     
    }
  }

  void handlReset() {
    email.clear();
    pass.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SinUp"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Card(
                  child: Image.asset(
                    "assets/love1.png",height: 250,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: "Enter Email Address:",
                          border: OutlineInputBorder()),
                      validator: (val) {
                        if (val == null || val.isEmpty)
                          return ("ERROR!Enter an Email.");
                      },
                      controller: email,
                      onSaved: (val) {
                        this.Email = val;
                      }
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: "Enter Pssword:",
                          border: OutlineInputBorder()),
                      validator: (val) {
                        if (val == null || val.length == 0)
                          return ("ERRO! Enter Password");
                      },
                      controller: pass,
                      onSaved: (val) {
                        this.Pass = val;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                 
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 110,
                      ),
                      RaisedButton(
                        child: Text(
                          "Reset",
                        ),
                        onPressed: () {
                          handlReset();
                        },
                      ),
                      SizedBox(
                        height: 10,
                        width: 35,
                      ),
                      RaisedButton(
                        color: Colors.green,
                        child: Text("SinUp"),
                        onPressed: () {
                          handleSubmit();
                        },
                      ),
                    ],
                  ),
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}