import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:missat/Provider/auth.dart';
import 'package:missat/Provider/database.dart';
import 'package:missat/component/chatItemW.dart';
import 'package:missat/component/constant.dart';
import 'package:missat/models/user.dart';
import 'package:missat/screens/profile.dart';


import 'Users.dart';
import 'login_screen.dart';

class Chats extends StatelessWidget {
  final FirebaseUser user;

  Chats({this.user});

  @override
  Widget build(BuildContext context) {





    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIconTheme: IconThemeData(color: otherMsg),
        animatedIcon: AnimatedIcons.menu_home,
        children: [
          SpeedDialChild(
             label: 'Users',
            child: IconButton(icon: Icon(Icons.people_outline, color: otherMsg,), onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> Users(
                  user: user,
                )
              ));
            })
          ),
          SpeedDialChild(
              label: 'Profile',
              child: IconButton(icon: Icon(Icons.person_outline, color: otherMsg,), onPressed: (){
               DatabaseFB().currentUser(user).then((me) {
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context)=>Profile(
                       user: me,
                     )
                 ));
               });
              })
          ),

          ],
      ),
      body:
      Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * .03),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBar(
                title: Text('Missat'),
                elevation: 0,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: FutureBuilder<QuerySnapshot>(
                    future: Firestore.instance
                        .collection('Chats')
                        .document(user.uid)
                        .collection('MyChats')
                        .getDocuments(),
                    builder: (context, snapshots) {
                      if (snapshots.data == null)
                        return Center(child: CircularProgressIndicator());
                      List<User> theOthers = [];
                      for (var doc in snapshots.data.documents) {
                        theOthers.add(
                            User(
                              photoUrl: doc.data['photoUrl'],
                              uid: doc.data['uid'],
                              name: doc.data['name'],
                            )
                        );
                      }


                      return ListView.builder(
                          itemCount: theOthers.length,
                          itemBuilder: (context, i) {
                            return ChatItemW(
                                user: user,
                                size: size,
                                otherUser: theOthers[i]
                            );
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
    }
  }
