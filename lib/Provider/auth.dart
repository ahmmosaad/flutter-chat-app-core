
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Auth {

  var _auth = FirebaseAuth.instance;





 signUp(String email, String password,) async {
   try{
     AuthResult result = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = result.user;

     return user;
   }   catch (ex){
     if(ex.toString().contains('email-already-in-use')){
       print('email already in use');

     }
     else if(ex.toString().contains('invalid-email')){
       print('invalid-email');
     }
     else if (ex.toString().contains('operation-not-allowed')){
       print('email/password accounts are not enabled');
     }
     else{
              print(ex);
     }
   }
  }



  Future<FirebaseUser> logIn(String email, String password) async {
        FirebaseUser user ;
        try{
          AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
          user = result.user;
        } catch(ex){

          if(ex.toString().contains('user-not-found')){
            print('email already in use');

          }
          else if(ex.toString().contains('invalid-email')){
            print('invalid-email');
          }
          else if (ex.toString().contains('user-disabled')){
            print('email/password accounts are not enabled');
          }
          else{
            print('wrong password');
          }
        }

    return user;
  }




  void signOut(){
    _auth.signOut();
  }

  Future<FirebaseUser> isSignedIn () async {
   FirebaseUser user = await _auth.currentUser();
    return user;
  }




}