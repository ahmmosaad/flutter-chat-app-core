import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:missat/Provider/database.dart';
import 'package:missat/models/massage.dart';
import 'package:missat/models/user.dart';
import 'package:missat/screens/chat_screen.dart';

import 'constant.dart';

class ChatItemW extends StatelessWidget {
  final FirebaseUser user;
  final User otherUser;
  final Size size;


  ChatItemW({this.user, this.size, this.otherUser, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatabaseFB().currentUser(user).then((me){
          print(me.name);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatScreen(
              otherUser: otherUser,
              user: me,
            );
          }));
        });
      },
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Chats').document(user.uid).collection('MyChats').document(otherUser.uid).collection('Massages').snapshots(),
        builder:(context , snaps){
          List<MassageM> massages = [];
         if(snaps.data == null) return Center(child: CircularProgressIndicator(),);
          for(var doc in snaps.data.documents){
            massages.add(MassageM(
              content: doc.data['content'],
              dateTime: doc.data['dateTime'],
              sender: doc.data['sender'],

            ));
          }
          return Container(
          margin: EdgeInsets.only(top: 10),
          height: size.height * .12,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              )),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
otherUser.photoUrl      ),
                  radius: 35,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            otherUser.name,
                            style: nameStyle,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  massages[0].dateTime,
                                  style: dateStyle,
                                ),
//                                Padding(
//                                  padding: const EdgeInsets.only(left: 10),
//                                  child: ClipRRect(
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(10)),
//                                    child: Container(
//                                      color: Colors.teal,
//                                      child: Text(
//                                        '  ' + '5' + '  ',
//                                        style: TextStyle(color: Colors.white),
//                                      ),
//                                    ),
//                                  ),
//                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                          constraints: BoxConstraints(
                            maxWidth: 150,
                          ),
                          child: Text(
                           massages[0].content,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        );}
      ),
    );
  }
}
