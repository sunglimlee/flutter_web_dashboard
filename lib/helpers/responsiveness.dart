import 'package:flutter/material.dart';

// 이부분이 아주 중요하다. 그리고 여기 숫자도 아주 중요하다. 왜냐면 여기 숫자가 거의 모든 화면 사이즈에 대응하니깐. common screen's breakpoint
const int largeScreenSize = 1366; // laptop
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;


class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen; // 이게 결국은 밖에서 가지고 들어오겠다는거네..
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;
  final GlobalKey<ScaffoldState> gKey;


  const ResponsiveWidget({Key? key, required this.largeScreen, this.mediumScreen, this.smallScreen, this.customScreen, required this.gKey}) : super(key: key);

  // 사이즈 확인위한 정적함수
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width < largeScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;

  static bool isCustomScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width <= customScreenSize;

  @override
  Widget build(BuildContext context) {
    // 여기서 LayoutBuilder 객체를 사용한다. 위젯을 리턴한다는데 어떤 위젯??? 위에는 그냥 이름만 다른 위젯인데?
    // [error] The body might complete normally, causing 'null' to be returned, but the return type, 'Widget', is a potentially non-nullable type.
    // [answer]
    return LayoutBuilder(builder: (context, constraints) {
      /*
        which size of screen we are going to return..... 다른거 다 필요없고 여기서 context 때문에 바로바로 반응한다.
        이해가 안되는게 이렇게 하면 두개의 레이아웃을 다 따로따로 만들어야 한다는 건데... 그래도 괜찮나? 일이 두배로 늘어나는것 아닐까?
        아니면 위젯들을 따로 모아놓고 그걸 사용하는건가? 그래서 위젯 디렉토리가 따로 존재하는 건가?
        아무튼 여기 LayoutBuilder 에서 그냥 바로바로 반응한다. 그럼 static 을 사용한 이유는 무엇일까?
      */
      double width = constraints.maxWidth; // 최대 넓이를 받고
      if (width >= largeScreenSize) {
        if (gKey.currentState!.isDrawerOpen) gKey.currentState!.closeDrawer();
        return largeScreen; // 이미 largeScreen 과 smallScreen 의 객체가 시작할 때 부터 존재하기 때문에 그걸 던져준다는 거지..
      }
      // [error] The return type 'Widget?' isn't a 'Widget', as required by the closure's context.
      // [answer] ?? 으로 null 에 대응하자.
      else if (width < largeScreenSize && width >= mediumScreenSize) {
        if (gKey.currentState!.isDrawerOpen) gKey.currentState!.closeDrawer();
        return mediumScreen ?? largeScreen;
      } // null 에 대응하자.
      else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
