



import 'package:flutter/cupertino.dart';
import 'package:missat/screens/chats.dart';
import 'package:missat/screens/profile.dart';
import 'package:missat/screens/setting.dart';

class HelperMeth {

  Widget navWigget(int ind){


    switch(ind){
      case 0: {return Profile();}
      break;
      case 1: {return Chats();}
      break;
      case 2: {return Setting();}
break;
      default: {return Chats();}

    }

  }




}