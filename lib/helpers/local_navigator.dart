import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/routing/router.dart';

import '../routing/routes.dart';

// 여기서 어떤 작업을 하는지 보자. 앞에서 만든 navigationController 을 어떻게 이용하는지도 보고.
Navigator localNavigator() => Navigator( // Navigator 를 바로 만들었다.
  key: navigationController.navigationKey,
  initialRoute: overViewPageRoute,
  onGenerateRoute: generateRoute,
);