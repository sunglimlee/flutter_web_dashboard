import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/controllers/navigation_controller.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(MenuController()); // MenuController 를 찾기 위해서 Get.put 을 맨처음에 넣어준다.
  Get.put(NavigationController()); // 여기도 똑같이 GetXController 를 상속받은걸 put 을 넣어주어서 항상 update 가 되도록 해준다.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // 이문장으로 3가지 중요한 기능을 편리하게 사용할 수 있다. (State, Route, Dependency)
      debugShowCheckedModeBanner: false,
      title: "Dash board",
      // 새롭게 theme 를 정의하는 법을 보여주고 있네.. 이렇게 처음에 다 정의해 놓는거구나.. 그렇지..
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.black), // 이문장으로 google fonts 를 쓸수가 있다.
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }) , // Page 변환에 대한 내용이구나.. 이거 대박인데... 페이지 에니메이션 효과를 위해서
        primaryColor: Colors.black,
      ),
      home: SiteLayout(

      ),
    );
  }

}