import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

Color color1 = Colors.blue;
Color color2 = Colors.amber;
bool isReaded = false;

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),
              GestureDetector(
                onHorizontalDragDown: (b){
                  setState(() {
                    isReaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  color: isReaded ? color1 : color2,
                  child: Text('Hello Man'),
                ),
              ),




              


            ],
          ),
        ),
      ),
    );
  }
}
