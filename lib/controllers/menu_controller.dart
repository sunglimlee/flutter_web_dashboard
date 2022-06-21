import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

// MenuController 가 필요한 이유
class MenuController extends GetxController {
/* 말되네.. find 로 무조건 찾을 수 있다고 했으니..
   앞으로 이렇게 자주 사용해야 겠다. 나는 항상 이걸 밖에서 사용하는 것만 생각했는데 글허게 할 필요가 없이. MenuController.instance 하면 바로 쓸 수 있네.
*/
  static MenuController instance = Get.find();
  var activeItem = overViewPageRoute
      .obs; // 바뀌지 않는 상수를 왜 obs 잡았지?????? activeItem 에 대해서 obs 를 해라는 건가????
  var hoverItem = ""
      .obs; // 그냥 완전히 비어있는거에다가 obs 를 잡아놨다. 이 느낌이 hoverItem 에 대해서 obs 를 해라는 건가????
  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }
  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  // 위에 내용을 토내로 Widget 을 리턴하는 메서드를 만든다.
  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overViewPageRoute :
        return _customIcon(Icons.trending_up, itemName);
      case driversPageRoute :
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageRoute :
        return _customIcon(Icons.people_alt_outlined, itemName);
      case authenticationPageRoute :
        return _customIcon(Icons.exit_to_app, itemName);
      default :
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }
  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark, );
    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey,);
  }

}
