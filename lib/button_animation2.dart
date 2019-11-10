import 'package:flutter/material.dart';

mixin ButtonAnimation<T extends StatefulWidget> on State<T> {
  final scrollController = ScrollController();

  Duration animationDuration = Duration(milliseconds: 1000);
  bool isVisible = true;

  ButtonProperties get _bottomProperties {
    return scrollController.positions.isEmpty
        ? ButtonProperties(false)
        : ButtonProperties(scrollController.offset > 44);
  }

  OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context).insert(this._overlayEntry);
    });
  }

  OverlayEntry _createOverlayEntry() {
    // RenderBox renderBox = context.findRenderObject();
    // var size = renderBox.size;
    // var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => (!isVisible)
          ? Container()
          : Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + kToolbarHeight,
              ),
              child: AnimatedBuilder(
                animation: scrollController,
                builder: (context, child) {
                  return AnimatedContainer(
                    duration: animationDuration,
                    curve: Curves.easeOutExpo,
                    alignment: _bottomProperties.alignment,
                    padding: EdgeInsets.only(bottom: 15),
                    child: FittedBox(
                      child: RaisedButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        elevation: 10,
                        onPressed: () async {
                          isVisible = false;
                          _overlayEntry.markNeedsBuild();
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              settings: RouteSettings(name: "teste"),
                              builder: (_) => Scaffold(
                                appBar: AppBar(
                                  title: Text("Add"),
                                ),
                              ),
                            ),
                          );
                          isVisible = true;
                          _overlayEntry.markNeedsBuild();
                        },
                        shape: _bottomProperties.shape,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: _bottomProperties.padding,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              if (!_bottomProperties.isBottom)
                                SizedBox(width: 15),
                              // Padding(padding: EdgeInsets.only(left: 15)),
                              if (!_bottomProperties.isBottom)
                                Text("ADD NEW ITEM"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class ButtonProperties {
  final bool isBottom;

  Alignment get alignment {
    return isBottom ? Alignment.bottomRight : Alignment.topCenter;
  }

  double get padding {
    return isBottom ? 20 : 8;
  }

  ShapeBorder get shape {
    return isBottom
        ? CircleBorder()
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          );
  }

  ButtonProperties(bool isBottom) : isBottom = isBottom;
}
