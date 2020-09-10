import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missat/Provider/database.dart';
import 'package:missat/component/constant.dart';
import 'package:missat/models/user.dart';
import 'package:missat/screens/profile.dart';
import 'chat_screen.dart';


class Users extends StatelessWidget {
  final FirebaseUser user;

  Users({this.user});



  @override
  Widget build(BuildContext context) {
    List<User> users = [];
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
          users.clear();
        }),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: SearchUsers(
              user,
              users
            ) );
          })
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection('Users')
            .getDocuments(),
        builder: (context, data) {


          if (data.data == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          for (var doc in data.data.documents) {


            if(doc.data['uid'] != user.uid){
              users.add(User(
                name: doc.data['name'],
                photoUrl: doc.data['photoUrl'],
                uid: doc.data['uid'],
              ));
            }


          }
          return Container(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Profile(
                          user: users[i],
                        );
                      }));
                    },
                    child: Container(
                      color: otherMsg,
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width *.1,),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(users[i].photoUrl),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width *.1,),
                          Text(users[i].name, style: nameStyle,),

                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}



class SearchUsers extends SearchDelegate{

  final List<User> users;

  final FirebaseUser user;
  SearchUsers(this.user, this.users);

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query='';
     })
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {



    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
      close(context, null);
    });
  }


  @override
  Widget buildResults(BuildContext context) {
     Navigator.pop(context);
     return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<User> results = users.where((user) => user.name.toLowerCase().startsWith(query)).toList();
    return  query.isEmpty ? Center(child: Text('Enter User name'),): ListView.builder(
        itemCount: results.length,
        itemBuilder: (c ,i)=> Container(
          color: otherMsg,
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(results[i].photoUrl),
              ),
              Text(results[i].name, style: nameStyle,),
              IconButton(icon: Icon(Icons.chat), onPressed: (){
                DatabaseFB().currentUser(user).then((me){
                  print(me.name);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChatScreen(
                      otherUser: results[i],
                      user: me,
                    );
                  }));
                });
              })
            ],
          ),
        ));
  }

}