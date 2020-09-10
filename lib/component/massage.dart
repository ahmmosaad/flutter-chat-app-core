import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missat/models/massage.dart';
import 'package:missat/models/user.dart';

import 'constant.dart';

class Massage extends StatelessWidget {

  final User user;
  final Size size;
  final MassageM massageM ;





  Massage({ this.user,  this.size, this.massageM});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          massageM.sender == user.uid  ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onVerticalDragDown: (v){
            massageM.readed = true;
          },
          child: Container(
            margin: EdgeInsets.only(top: 5),
            constraints: BoxConstraints(maxWidth: size.width * .7),
            decoration: BoxDecoration(
//              color: massageM.readed ? Colors.blueGrey : Colors.amber,
                color:massageM.sender == user.uid? myMsg : otherMsg,
                borderRadius: massageM.sender == user.uid
                    ? BorderRadius.only(
                        topRight: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      )),
            child: Padding(
              padding:   massageM.sender == user.uid
                  ? EdgeInsets.only(top: 5.0, right: 30, left: 10, bottom: 10)
                  : EdgeInsets.only(top: 5.0, left: 30, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment:
                massageM.sender == user.uid ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Text(
                    massageM.dateTime,
                    style: dateStyle,
                  ),
                  Text(
                    massageM.content,
                    style: TextStyle(color:  massageM.sender == user.uid ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
