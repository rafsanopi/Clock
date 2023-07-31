import 'package:clockapp/const/enums.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imgsourse;

  MenuInfo(this.menuType, {this.imgsourse = "none", this.title = "none"});

  updateMenuinfo(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imgsourse = menuInfo.imgsourse;

    notifyListeners();
  }
}
