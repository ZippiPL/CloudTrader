import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vapestore/screens/list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'additem_page.dart';
import 'connection.dart';
import 'image_slider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final databaseReference =
      FirebaseDatabase.instance.reference().child("users");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControllernick = TextEditingController();
  TextEditingController _emailFieldController;
  TextEditingController _passwordFieldController;
  TextEditingController _nicklFieldController;

  String _email;
  String _password;
  String _loginname;
  FormType _formType = FormType.login;

  void _showToast(String toastText) {
    Toast.show("${toastText}", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  registerIn() {}

  void signIn() async {
    _showToast("Weyfikacja w toku...");
    _emailFieldController =  new TextEditingController(text: myControllerEmail.text);
    _nicklFieldController = new TextEditingController(text:myControllernick.text);
    _passwordFieldController =
        new TextEditingController(text: myControllerPassword.text);
    _email = _emailFieldController.text;
    _password = _passwordFieldController.text;
    _loginname = _nicklFieldController.text;

    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        //login

        if (_formType == FormType.login) {
          print("email =${_email}");
          print("password =${_password}");

          FirebaseUser user = (await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _email, password: _password))
              .user;
          print('Signed in: ${user.uid}');
          //navigate
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        } else {
          _showToast("Rejestracja w toku...");
          FirebaseUser user = (await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _email, password: _password))
              .user;
          databaseReference.push().set({
            'email': '${_email}',
            'password': '${_password}',
            'nick': '${_loginname}'
          });
          print('Registered user: ${user.uid}');
        }
      } catch (e) {
        print('Error $e');
      }
    }
  }

  void moveToRegister() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  //
  void moveToList() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddItemPage()));
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Color.fromRGBO(214, 214, 214,5),
      backgroundColor: Color.fromRGBO(149, 185, 199, 10),
      /* appBar: new AppBar(
          title: Center(
        child: Text(
          'Cloud Trade',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      )), */
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 85.0,
                ),
                Container(
                  width: 350.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/cloudtrader.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInputs() + buildSubmitButtons(),
                ),
                //
                Container(
                  child: FlatButton(
                    child: Text('TestingButton'),
                    color: Colors.red,
                    onPressed: moveToList,
                  ),
                )
                //
              ],
            ),
          )),
    );
  }

  List<Widget> buildInputs() {
    return [
      CustomInputField(
          330, Icon(Icons.person), 'Email', _email, false, myControllerEmail),
      SizedBox(
        height: 10.0,
      ),
      CustomInputField(330, Icon(Icons.lock), 'Haslo', _password, true,
          myControllerPassword),
      SizedBox(
        height: 10.0,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          color: Colors.lightBlue,
          elevation: 5.0,
          hoverColor: Color.fromRGBO(31, 69, 252, 10),
          onPressed: signIn,
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        new FlatButton(
          child: new Text('Nie masz konta ? Kliknij Tutaj!',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        CustomInputField(330, Icon(Icons.people_outline), 'Nazwa Użytkownika',
            _loginname, false, myControllernick),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          color: Colors.lightBlue,
          elevation: 5.0,
          hoverColor: Color.fromRGBO(31, 69, 252, 10),
          onPressed: signIn,
          child: Text(
            'Utwórz Konto',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        new FlatButton(
          child: new Text('Masz już konto ? Zaloguj',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: moveToLogin,
        )
      ];
    }
  }
}
