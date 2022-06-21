import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

// 뭘하는지 모르겠지만 그냥 따라가 보자.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageRoute :
      return _getPageRoute(const OverViewPage());
    case driversPageRoute :
      return _getPageRoute(const DriversPage());
    case clientsPageRoute :
      return _getPageRoute(const ClientsPage());
    case authenticationPageRoute :
      return _getPageRoute(const AuthenticationPage());
    default :
      return _getPageRoute(const OverViewPage());

  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child); // 여기서 기본 에니메이션이 실행되네, 여기도 context 가 있는데?
}