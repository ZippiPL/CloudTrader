import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget{

  Icon fieldIcon;
  String hintText;
  String validator;
  bool _obscureText;
  String _email;
  CustomInputField(this.fieldIcon,this.hintText, this.validator,this._obscureText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 250,
      child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.lightBlue,
        // color: Color.fromRGBO(31, 69, 252, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fieldIcon,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                ),
                width: 330,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                  obscureText:_obscureText,
                   validator: (value) => value.isEmpty ? 'Pole Nie Może być puste' : null,
                   onSaved: (value) => validator = value,
                   
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        fillColor: Colors.white,
                        filled: true
                    ),

                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}