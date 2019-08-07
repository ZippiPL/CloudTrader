import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _loginname;
  FormType _formType = FormType.login;

  void signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        //login
       
        if (_formType == FormType.login) {
           Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
          FirebaseUser user = (await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _email, password: _password))
              .user;
          print('Signed in: ${user.uid}');
          //navigate
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        } else {
          FirebaseUser user = (await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _email, password: _password))
              .user;
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
              ],
            ),
          )),
    );
  }

  List<Widget> buildInputs() {
    return [
      CustomInputField(Icon(Icons.person), 'Email', _email, false),
      SizedBox(
        height: 10.0,
      ),
      CustomInputField(Icon(Icons.lock), 'Haslo', _password, true),
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
        CustomInputField(
            Icon(Icons.people_outline), 'Nazwa Użytkownika', _loginname, false),
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
