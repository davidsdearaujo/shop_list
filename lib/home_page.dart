import 'dart:math';

import 'package:flutter/material.dart';

import 'button_animation.dart';
import 'item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, ButtonAnimation {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Shop Items (3)"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: <Widget>[
          RefreshIndicator(
            onRefresh: () async => Future.delayed(
              Duration(milliseconds: 500),
              () => setState(() {}),
            ),
            child: ListView.separated(
              controller: scrollController,
              padding: EdgeInsets.fromLTRB(20, 70, 20, 100),
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: 50,
              itemBuilder: (context, index) {
                return ItemWidget(
                  rate: Random().nextInt(5),
                );
              },
            ),
          ),
          buildActionButton(),
        ],
      ),
    );
  }

  Widget buildActionButton() {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        return AnimatedContainer(
          duration: animationDuration,
          curve: Curves.easeOutExpo,
          alignment: bottomProperties.alignment,
          padding: EdgeInsets.only(bottom: 15),
          child: FittedBox(
            child: RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              elevation: 10,
              onPressed: () {},
              shape: bottomProperties.shape,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: bottomProperties.padding,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    if (!bottomProperties.isBottom)
                      SizedBox(width: 15),
                    // Padding(padding: EdgeInsets.only(left: 15)),
                    if (!bottomProperties.isBottom)
                      Text("ADD NEW ITEM"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
