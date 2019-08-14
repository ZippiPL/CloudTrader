import 'package:flutter/material.dart';
import 'package:vapestore/customwidgets/custominputfield.dart';
import 'package:vapestore/customwidgets/custominputfieldshort.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:vapestore/screens/list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'additem_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class Adding_picture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Adding_picture();
}

class _Adding_picture extends State<Adding_picture> {
  File _image;

  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        print('Image Path $_image ');
      });
    }

    Future uploadPic(BuildContext context) async {
      String filName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(filName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print('ProfileUpdated');
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Updated'),
        ));
      });
    }

    return new Scaffold(
        appBar: new AppBar(
          title: Text('elo'),
        ),
        body: Builder(
            builder: (context) => Container(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.amber,
                        child: ClipOval(
                          child: SizedBox(
                            width: 180,
                            height: 180,
                            child: Image.network(
                                "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.camera),iconSize: 30.0,onPressed: (){
                        getImage();
                        //uploadPic(context);
                        } ,),
                        IconButton(icon: Icon(Icons.audiotrack),iconSize: 30.0,onPressed: (){
                        
                        uploadPic(context);
                        } ,)
                    ],
                  ),
                )));
  }
}
