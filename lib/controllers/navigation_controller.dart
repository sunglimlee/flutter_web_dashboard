
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find(); // 알고 있지 Get.find() 로 자동으로 찾아준다는 걸.
  /* global key 는 전체 앱에서 고유한 key 이며 element 를 고유하게 식별한다.
    특정 위젯의 정보를 완전히 다른 위젯트리 (예: 빌드 컨텍스트) 에서 접근가능하게 하며
    StatefulWidgets 의 경우 State 에 대한 액세스 권한도 제공해 위젯이 상태를 잃지 않으면서
    부모를 바꿀 수 있도록 해준다.
    https://nsinc.tistory.com/214 : key 는 무엇인가?
    https://seizemymoment.tistory.com/50

    https://medium.com/flutter-community/navigate-without-context-in-flutter-with-a-navigation-service-e6d76e880c1c
   */
  final GlobalKey<NavigatorState> navigationKey = GlobalKey(); // 이게 전역변수 같은 건가?

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }
  goBack() => navigationKey.currentState!.pop();

}