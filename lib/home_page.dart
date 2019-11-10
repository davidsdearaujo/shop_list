import 'dart:math';

import 'package:flutter/material.dart';

import 'button_animation2.dart';
import 'item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver, ButtonAnimation {
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
          // buildActionButton(),
        ],
      ),
    );
  }
}
