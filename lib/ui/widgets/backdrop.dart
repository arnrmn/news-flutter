import 'package:flutter/material.dart';

class Backdrop extends StatefulWidget {
  final Widget front;
  final Widget back;

  const Backdrop({@required this.front, @required this.back, Key key})
      : assert(front != null),
        assert(back != null),
        super(key: key);

  @override
  State createState() => _State();
}

class _State extends State<Backdrop> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: "Backdrop");

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: _backdropKey,
      children: <Widget>[widget.back, widget.front],
    );
  }
}
