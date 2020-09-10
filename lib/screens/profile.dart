 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:missat/Provider/auth.dart';
import 'package:missat/component/constant.dart';
import 'package:missat/models/user.dart';

import 'login_screen.dart';
class Profile extends StatelessWidget {

  final User user;

  Profile({this.user});


  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                icon: Icon(FontAwesomeIcons.signOutAlt, color: dateColor,),
                onPressed: () {
                  Auth().signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LogIn()));
                }),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height *.1),
        color: Colors.white,
        child: Column(
          children: [
            CircleAvatar(
              radius: size.width / 5,
              backgroundImage: NetworkImage(user.photoUrl),
            ),
            SizedBox(height: size.height *.05,),
            Text(user.name, style: TextStyle(fontSize: 25, fontFamily: 'BalooTamma2', fontWeight: FontWeight.bold),),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                color: myMsg,
              ),
            ),
            SizedBox(height: 10,),
            Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: size.height*0.025),
              height: size.height *.1,
              color: otherMsg,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Column(
                    children: [
                      Text('Friends'),
                      Text('10'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Chats'),
                      Text('10'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Join Date'),
                      Text('10/2/2020'),
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
