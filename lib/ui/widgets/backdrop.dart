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
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isFrontVisible {
    final status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  void _toggleBackgroundVisibility() {
    _controller.fling(velocity: _isFrontVisible ? -1 : 1);
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - 48;
    final double bottom = -48;
    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      leading: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: _controller.view,
        ),
        onPressed: _toggleBackgroundVisibility,
      ),
      title: Text('Source name'),
    );

    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(builder: _buildStack),
    );
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Stack(
        children: <Widget>[
          Center(child: widget.back),
          PositionedTransition(
            rect: _getPanelAnimation(constraints),
            child: widget.front,
          ),
        ],
      ),
    );
  }
}
