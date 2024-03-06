
import 'package:flutter/foundation.dart';

class BottomNavigationBarItemProvider extends ChangeNotifier{
  int _index=0;
  int getIndex()=>_index;
  void indexChanged(int index){
    _index=index;
    notifyListeners();
  }
}