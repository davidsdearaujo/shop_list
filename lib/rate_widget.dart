import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final int rate;
  final int maxRate;
  final double size;
  final Color color;

  const RateWidget(
    this.rate, {
    Key key,
    this.size = 15,
    this.maxRate = 5,
    this.color = Colors.black,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(size: size, color: color),
      child: Row(
        children: List.generate(rate, (index) => Icon(Icons.star)) +
            List.generate(maxRate - rate, (index) => Icon(Icons.star_border)),
      ),
    );
  }
}
