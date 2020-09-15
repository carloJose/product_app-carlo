import 'package:flutter/material.dart';


// i have to ajust it to Navigation pages
Route createRoute(context,pageToGo) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => pageToGo(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      print("oi");

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}