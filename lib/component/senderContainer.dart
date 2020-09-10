import 'package:flutter/material.dart';
import 'package:missat/Provider/database.dart';
import 'package:missat/component/constant.dart';
import 'package:intl/intl.dart';
import 'package:missat/models/user.dart';
class Sender extends StatelessWidget {
  final Size size;
  final User user;
  final User otherU;


  Sender({this.size,  this.otherU, this.user});
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    String massage0;
    DateTime date = DateTime.now();
    var formatter = new DateFormat.jm().format(date);

    return Container(
      width: size.width,
      height: size.height * .09,
      color: otherMsg,
      child: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
              onChanged: (value){
                massage0 = value;
              },
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                  color: Colors.white,
                  child: IconButton(
                      icon: Icon(Icons.attachment),
                      onPressed: () {})),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Container(
                  color: myMsg,
                  child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.clear();
                        DatabaseFB().addMassage(
                            massage: massage0,
                        sender: user.uid,
                        date: formatter.toString(),
                        myUid: user,
                        otherU: otherU);
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
