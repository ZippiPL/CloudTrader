import 'package:flutter/material.dart';

class CustomInputFieldShort extends StatelessWidget{
  TextEditingController _controller;
  Icon fieldIcon;
  String hintText;
  String validator;
  bool _obscureText;
  String value;
  double szerokosc,widthsze;
  CustomInputFieldShort(this.widthsze,this.szerokosc,this.fieldIcon,this.hintText, this.validator,this._obscureText,this._controller);


  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Container(
      width: widthsze,
      child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //color: Colors.lightBlue,
         
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                width: szerokosc,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                  keyboardType: TextInputType.number,
                 controller: _controller,
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