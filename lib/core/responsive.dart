import 'package:flutter/material.dart';

class Screensize {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 800;

  static bool isWeb(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 800;

  static T value<T>(BuildContext context, {required T mobile, required T web}) {
    return isWeb(context) ? web : mobile;
  }

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;
  static double height(BuildContext context) => MediaQuery.sizeOf(context).height;
}