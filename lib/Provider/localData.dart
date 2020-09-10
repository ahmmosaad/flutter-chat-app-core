

import 'package:flutter/foundation.dart';
import 'package:missat/models/massage.dart';

class LocalData extends ChangeNotifier{

  List<List<MassageM>> massages = [];




  addMassage(List<MassageM> userList){
    massages.add(userList);
    notifyListeners();
  }





}