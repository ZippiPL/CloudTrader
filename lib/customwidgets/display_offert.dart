import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/customwidgets/custominputfieldshort.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vapestore/screens/list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:vapestore/customwidgets/addpicture.dart';

class DisplayOffert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DisplayOffert();
}

class _DisplayOffert extends State<DisplayOffert> {
//
final databaseReference =
      FirebaseDatabase.instance.reference().child('products').child('Box').orderByChild('Opis');
     
     
     
//

readData(){
  databaseReference.once().then((DataSnapshot dataSnapShot){
      Map<dynamic,dynamic>values=dataSnapShot.value['Opis'];
      print(dataSnapShot.value);
      print('     ');
      print(values['Opis']);
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elo'),
      ),
      body: ListView(
        children: <Widget>[
        
          RaisedButton(
            child: Text('ELO'),
            color: Colors.red,
            onPressed: readData,
          ),
          Text('elo'),
          itemCard('EHPRO COLD STEEL', 'assets/images/ehpro.jpg', false),
        ],
      ),
    );
  }

  Widget itemCard(String title, String imgPath, bool isFavourite) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Material(
                      elevation: isFavourite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isFavourite
                                ? Colors.white.withOpacity(0.2)
                                : Colors.white),
                        child: Center(
                            child: isFavourite
                                ? Icon(
                                    Icons.report,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.report,
                                    color: Colors.red,
                                  )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                    width: 175.0,
                    child: Text(
                      'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    )),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.0),
                    Container(
                      height: 30,
                      width: 50.0,
                      color: Colors.lightBlue,
                      child: Center(
                        child: Text(
                          '59.99',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      color: Colors.lightBlueAccent,
                      child: Center(
                        child: Text('Kontakt'),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
