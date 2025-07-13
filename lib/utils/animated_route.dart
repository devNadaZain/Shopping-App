import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final SlideDirection direction;

  SlideRoute({required this.page, this.direction = SlideDirection.right})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Offset begin;
          switch (direction) {
            case SlideDirection.right:
              begin = const Offset(1.0, 0.0);
              break;
            case SlideDirection.left:
              begin = const Offset(-1.0, 0.0);
              break;
            case SlideDirection.up:
              begin = const Offset(0.0, 1.0);
              break;
            case SlideDirection.down:
              begin = const Offset(0.0, -1.0);
              break;
          }

          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      );
}

enum SlideDirection { right, left, up, down }

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.elasticOut),
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      );
}
