import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:missat/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'Provider/localData.dart';

void main() {
  runApp(

      MyApp(
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider.value(
      value: LocalData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Color(0xff1EB2A6),
        ),
          home: LogIn()),
    );
  }
}
