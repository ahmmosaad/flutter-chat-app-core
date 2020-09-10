import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:missat/Provider/database.dart';
import 'package:missat/Provider/storage.dart';
import 'package:missat/Provider/auth.dart';
import 'package:missat/component/constant.dart';
import 'package:missat/component/field.dart';
import 'package:missat/models/user.dart';
import 'package:missat/screens/chats.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

String email;
String name;
String passwrd;
String rePasswrd;
File image;
bool signUp = false;
bool issign = true;
FirebaseUser user;

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
   final fbm = FirebaseMessaging();
   fbm.requestNotificationPermissions();
   fbm.configure(
     onMessage: (mss){
       print(mss);
       return ;
     },
     onLaunch: (mss){
      print(mss);
      return ;
    }


   );
   fbm.subscribeToTopic('Chats');
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder<FirebaseUser>(
            future: Auth().isSignedIn(),
            builder: (context, reUser) {
              if (reUser.data != null)
                return Chats(
                  user: reUser.data,
                );
              return Container(
                padding:
                    EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
                height: size.height,
                width: double.infinity,
                child: Form(
                  autovalidate: true,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Missat ..',
                            style: TextStyle(
                                fontFamily: 'BalooTamma2',
                                fontSize: 50,
                                color: myMsg),
                          ),
                          signUp
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                        radius: 50,
                                        backgroundImage: image != null
                                            ? FileImage(image)
                                            : NetworkImage(
                                                'https://www.digitalparadigm.ca/wp-content/uploads/2015/01/Picture-of-person.png')),
                                    Container(
                                        color: otherMsg,
                                        child: FlatButton(
                                            onPressed: () async {
                                              ImagePicker picker =
                                                  ImagePicker();
                                              final pickedFile =
                                                  await picker.getImage(
                                                      source:
                                                          ImageSource.gallery);
                                              print(
                                                  'path : ' + pickedFile.path);
                                              final picked =
                                                  File(pickedFile.path);
                                              setState(() {
                                                image = picked;
                                              });
                                            },
                                            child: Text("Upload Image"))),
                                  ],
                                )
                              : SizedBox(),
                          signUp
                              ? Field(
                                  label: 'Name',
                                  hint: 'Enter Your Name',
                                  iconData: Icons.person_outline,
                                  change: (name0) {
                                    setState(() {
                                      name = name0;
                                    });
                                  },
                                  validation: (String name) {
                                    if (name.length < 4)
                                      return 'Please Enter Vaild Name';
                                    else
                                      return null;
                                  },
                                )
                              : SizedBox(),
                          Field(
                            label: 'Email',
                            hint: 'Enter Email',
                            iconData: Icons.email,
                            change: (mail) {
                              setState(() {
                                email = mail;
                              });
                            },
                            validation: (email) {
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(email))
                                return 'Please Enter Vaild E-Mail';
                              else
                                return null;
                            },
                          ),
                          Field(
                            label: 'Password',
                            hint: 'Enter PassWord',
                            iconData: Icons.lock_outline,
                            change: (pass) {
                              setState(() {
                                passwrd = pass;
                              });
                            },
                            validation: (String pass) {
                              if (pass.length < 8)
                                return 'Password less than 8';
                              else
                                return null;
                            },
                          ),
                          signUp
                              ? Field(
                                  label: 'Password',
                                  hint: 'reEnter PassWord',
                                  iconData: Icons.lock_outline,
                                  change: (pass2) {
                                    setState(() {
                                      rePasswrd = pass2;
                                    });
                                  },
                                  validation: (String pass2) {
                                    if (pass2 != rePasswrd)
                                      return 'Password less than 8';
                                    else
                                      return null;
                                  },
                                )
                              : SizedBox(),
                          SizedBox(height: 15),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                color: myMsg,
                                width: size.width * .8,
                                child: FlatButton(
                                    onPressed: () async {
                                      if (signUp) {
                                        Auth()
                                            .signUp(email, passwrd)
                                            .then((user) {
                                          StorageFB()
                                              .uploadImage(image, user.uid)
                                              .then((imageUrl) {

                                            DatabaseFB().newUser(
                                                name, imageUrl, user.uid);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Chats(
                                                          user: user,
                                                        )));
                                          });
                                        });

                                      }
                                      else {
                                        Auth()
                                            .logIn(email, passwrd)
                                            .then((user) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Chats(
                                                        user: user,
                                                      )));
                                        });


                                      }

                                    },
                                    child: Text('Log In',
                                        style:
                                            TextStyle(color: Colors.white)))),
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  signUp = !signUp;
                                });
                              },
                              child: Text(
                                  'Or Click here for ${signUp ? ' LOGIN' : 'SIGN UP'}')),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
