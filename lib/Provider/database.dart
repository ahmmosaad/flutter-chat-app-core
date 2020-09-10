import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:missat/models/user.dart';
import 'package:missat/screens/login_screen.dart';

class DatabaseFB {

  var _db = Firestore.instance;




  addMassage({
    User myUid, User otherU, String massage, String date, String sender
}) async {


        _db.collection('Chats').document(myUid.uid).collection('MyChats').document(otherU.uid).setData({
            'name':  otherU.name,
            'uid': otherU.uid,
            'photoUrl': otherU.photoUrl ,

        });
        _db.collection('Chats').document(myUid.uid)
            .collection('MyChats').document(otherU.uid)
            .collection('Massages').document()
            .setData({
          'sender': sender,
          'dateTime': date,
          'content': massage,
        });



        _db.collection('Chats').document(otherU.uid).collection('MyChats').document(myUid.uid).setData({
          'name':  myUid.name,
          'uid': myUid.uid,
          'photoUrl': myUid.photoUrl ,

        });


          _db.collection('Chats').document(otherU.uid)
              .collection('MyChats').document(myUid.uid)
              .collection('Massages').document()
              .setData({
            'sender': sender,
            'dateTime': date,
            'content': massage,
          });




  }






  newUser(String name, String photoUrl, String uid){
    _db.collection('Users').document(uid).setData({
      'name': name,
      'photoUrl': photoUrl,
      'uid':uid
    });

  }


  Future<User> currentUser(FirebaseUser user)async{
    User userR;
    QuerySnapshot querySnapshot = await _db.collection('Users').where('uid',isEqualTo: user.uid ).getDocuments();
    for(var doc in querySnapshot.documents){
      userR = User(
        photoUrl: doc.data['photoUrl'],
        uid: doc.data['uid'],
        name: doc.data['name'],
      );

    }
    return userR;
  }





}

