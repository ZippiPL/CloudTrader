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
import 'package:path/path.dart';

class AddPicture {
  File _image;
  BuildContext context;
  AddPicture();
  String name;
  String folder;
  Future uploadPic(folder,name) async {
    String filName = name;
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(folder).child(name);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

  }
    
  

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = image;
    print('Image Path $_image ');
  }
  }

