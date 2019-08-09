import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vapestore/screens/list.dart';

class Connectionn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Connectionn();
}

enum FormType { nazwa, lokalizacja }


class _Connectionn extends State<Connectionn> {
  FormType _formType = FormType.lokalizacja;
  final databaseReference =
      FirebaseDatabase.instance.reference().child("users");

  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();
  TextEditingController _emailFieldController;
  TextEditingController _passwordFieldController;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  void _showToast(String toastText) {
    Toast.show("${toastText}", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  sendDataRegister() {
    print("nope");
   return [CustomInputField(330,Icon(Icons.lock), 'Haslo', _password, true,
                myControllerPassword)];
  }

   void moveToLokalizacja() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.lokalizacja;
    });
  }

  void moveToNazwa() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.nazwa;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('elo'),
        ),
        body: Container(
          child: Form(
            key: _formKey,
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomInputField(330,
                    Icon(Icons.person), 'Email', _email, false, myControllerEmail),

                SizedBox(
                  height: 10.0,
                ),

              
                FlatButton(
                  child: Text('Send'),
                  onPressed: sendDataRegister,
                ),
                FlatButton(
                  child: Text('lokalizacja'),
                  onPressed: moveToLokalizacja,
                ),
                FlatButton(
                  child: Text('nazwa'),
                  onPressed: moveToNazwa,
                ),
                  SizedBox(
                  height: 20.0,
                ),
                 FlatButton(
                  child: Text('click'),
                  onPressed: buildSubmitButtons,
                ),
                
              ],
            ),
          ),
        ));
  }




  buildSubmitButtons() {
  
    if (_formType == FormType.nazwa) {
      print('nazwa');
    } else {print("lokalizacja");
      
    }
  }

}
