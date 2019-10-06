import 'package:flutter/material.dart';

import 'rate_widget.dart';

class ItemWidget extends StatefulWidget {
  final bool isRight;
  final int rate;

  const ItemWidget({
    Key key,
    @required this.rate,
  })  : assert(rate != null, "O parâmetro 'rate' é obrigatório"),
        isRight = rate >= 3,
        super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final double _radius = 15;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildCard(),
        Positioned(
          right: 25,
          child: buildImage(),
        ),
        Positioned(
          bottom: 0,
          right: widget.isRight ? 0 : null,
          left: widget.isRight ? null : 0,
          child: buildMessage(),
        )
      ],
    );
  }

  Widget buildMessage() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.isRight ? null : Colors.white,
        gradient: !widget.isRight
            ? null
            : LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF8DD6EF), Color(0xFF7BFBB4)],
              ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_radius),
          bottomRight: Radius.circular(_radius),
          topLeft: Radius.circular(widget.isRight ? _radius : 0),
          topRight: Radius.circular(widget.isRight ? 0 : _radius),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 10),
            color: Colors.black26,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text("AI"),
            backgroundColor: Color(0xFFA123B2),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Deivão",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 5),
                    RateWidget(widget.rate),
                  ],
                ),
                Text(
                  "When a row is in a parent that does not provide a finite width constraint, for example if it is in a" +
                      "When a row is in a parent that does not provide a finite width constraint, for example if it is in a",
                  style: TextStyle(color: Colors.black54),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildImage() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 10),
              color: Colors.blue[400].withOpacity(.5),
            )
          ]),
      child: Image.network(
        "https://i.imgur.com/kzb8I13.png",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildCard() {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MediaQuery.of(context).size.width * 0.003,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 75),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: !widget.isRight ? null : Colors.white,
            gradient: widget.isRight
                ? null
                : LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFFCE4454), Color(0xFF882269)],
                  ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 5),
                color: Colors.blue[100],
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Nike Jordan III",
                style: TextStyle(
                  color: widget.isRight ? Colors.blue : Colors.white,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "4.6",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: widget.isRight ? Colors.black : Colors.amber,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: widget.isRight ? Colors.black : Colors.amber,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text.rich(TextSpan(
                    style: TextStyle(
                      color: widget.isRight ? Colors.black : Colors.white,
                    ),
                    children: [
                      TextSpan(text: "Bought "),
                      TextSpan(
                        text: "1,361 ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "times for a profit of "),
                    ],
                  )),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "\$13k",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
