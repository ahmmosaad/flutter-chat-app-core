import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missat/component/bottomContainer.dart';
import 'package:missat/component/massage.dart';
import 'package:missat/component/senderContainer.dart';
import 'package:missat/models/massage.dart';
import 'package:missat/models/user.dart';


class ChatScreen extends StatelessWidget {
  final User user;
  final User otherUser;

  ChatScreen({this.user, this.otherUser});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  otherUser.name,
                  style: TextStyle(fontFamily: 'BalooTamma2', fontSize: 25),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(otherUser.photoUrl),
                  ),
                ),
              ],
            ),
            Expanded(
                child:Container(
                  padding: EdgeInsets.all(10),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection('Chats')
                        .document(user.uid).collection('MyChats')
                        .document(otherUser.uid).collection('Massages').snapshots(),

                      builder: (context , snapshot){
                      if(snapshot.data == null) return Center(child: CircularProgressIndicator(),);
                      List<MassageM> massage = [];
                      for(var doc in snapshot.data.documents){
                        massage.add(MassageM(
                          content: doc.data['content'],
                          dateTime: doc.data['dateTime'],
                          sender: doc.data['sender'],

                        ));

                      }

                      return ListView.builder(
                        reverse: true,
                          itemCount: massage.length,
                          itemBuilder: (context, i){
                        return Massage(
                          user: user,
                          size: size,
                          massageM:massage[i],
                        );
                      });

                    }),
                )),
            Padding(
              padding: const EdgeInsets.all(8),
              child: BottomContainer(size: size, child: Sender(
                user: user,
                otherU: otherUser,
                size: size,),),
            ),
          ],
        ),
      ),
    );
  }
}


