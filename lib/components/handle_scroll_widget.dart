import 'package:flutter/material.dart';

class HandleScrollWidget extends StatefulWidget {
  final BuildContext context;
  final Widget child;
  final ScrollController controller;

  const HandleScrollWidget(
    this.context, {
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  State<HandleScrollWidget> createState() => _HandleScrollWidgetState();
}

class _HandleScrollWidgetState extends State<HandleScrollWidget> {
  double? _offset;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(widget.context).viewInsets.bottom;

    if (bottom == 0) {
      _offset = null;
    } else if (bottom != 0 && _offset == null) {
      _offset = widget.controller.offset;
    }

    if (bottom > 0) widget.controller.jumpTo(_offset! + bottom);

    return widget.child;
  }
}
