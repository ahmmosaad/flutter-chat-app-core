import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';




class StorageFB {

  var storage = FirebaseStorage.instance;


  Future<String> uploadImage(File file, String uid)async {
   StorageTaskSnapshot result =await storage.ref().child('Profile Images/$uid').putFile(file).onComplete;
   String url = await result.ref.getDownloadURL();
   print(url);
   return url;
  }




}