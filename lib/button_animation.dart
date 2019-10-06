import 'package:flutter/widgets.dart';

mixin ButtonAnimation<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  ScrollController scrollController;

  Duration animationDuration = Duration(milliseconds: 1000);

  ButtonProperties get bottomProperties {
    return scrollController.positions.isEmpty
        ? ButtonProperties(false)
        : ButtonProperties(scrollController.offset > 44);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
