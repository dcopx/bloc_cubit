import 'package:flutter/material.dart';

class WidgetsShared extends StatelessWidget {
  final int tag;
  final Function action;
  final String text;
  const WidgetsShared(
      {super.key, required this.tag, required this.action, required this.text});

  FloatingActionButton customFloatingActionButton() {
    return FloatingActionButton(
      heroTag: tag,
      onPressed: action(),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return customFloatingActionButton();
  }
}
