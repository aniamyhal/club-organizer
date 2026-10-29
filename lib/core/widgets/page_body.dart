import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  const PageBody({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.sizeOf(context).width < 700
        ? 20.0
        : 32.0;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 8, horizontalPadding, 32),
      child: child,
    );
  }
}
