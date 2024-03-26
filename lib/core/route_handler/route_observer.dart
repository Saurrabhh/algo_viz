import 'package:algo_viz/utils/extensions/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print(
        '''========== didPop from ${route.toJson()} to ${previousRoute.toJson()}''',
      );
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print(
        '''========== didPush from ${previousRoute.toJson()} to ${route.toJson()}''',
      );
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print(
        '''========== didRemove from ${previousRoute.toJson()} to ${route.toJson()}''',
      );
    }
  }

  @override
  void didReplace({Route? newRoute, Route<dynamic>? oldRoute}) {
    if (kDebugMode) {
      print(
        '''========== didReplace from ${oldRoute.toJson()} to ${newRoute.toJson()}''',
      );
    }
  }
}
