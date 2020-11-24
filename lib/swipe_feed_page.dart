import 'package:flutter/material.dart';
import 'cards_section_alignment.dart';
import 'cards_section_draggable.dart';

int command = 0;

class SwipeFeedPage extends StatefulWidget {
  @override
  _SwipeFeedPageState createState() => _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage> {

  bool showAlignmentCards = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              print("GOES TO SETTINGS");
            }, icon: Icon(Icons.settings, color: Colors.grey[700])),
        title: Switch(
          onChanged: (bool value) => setState(() => showAlignmentCards = value),
          value: showAlignmentCards,
          activeColor: Colors.red,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("GOES TO CHAT");
              },
              icon: Icon(Icons.question_answer, color: Colors.grey[700])),
        ],
      ),
      backgroundColor: Colors.white
      ,
      body: Column(
        children: <Widget>[
          showAlignmentCards
              ? CardsSectionAlignment(context,command)
              : CardsSectionDraggable(),
          buttonsRow(),
        ],
      ),
    );
  }

  Widget buttonsRow() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            elevation: 4,
            mini: true,
            onPressed: () {
              print("UNDO");
              setState(() {
                command = 1;
              });
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.loop, color: Colors.deepPurple[700]),
          ),
          Padding(padding: EdgeInsets.only(right: 7.0)),
          FloatingActionButton(
            elevation: 7,
            onPressed: () {
              print("DISLIKE");
              setState(() {
                command = 2;
              });
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.black87, size: 33,),
          ),
          Padding(padding: EdgeInsets.only(right: 13.0)),
          FloatingActionButton(
            elevation: 7,
            onPressed: () {
              setState(() {
                command = 3;
              });
              print("LIKE");
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite, color: Colors.purple[700], size: 33,),
          ),
          Padding(padding: EdgeInsets.only(right: 7.0)),
          FloatingActionButton(
            elevation: 4,
            mini: true,
            onPressed: () {
              print("SUPERLIKE");
              setState(() {
                command = 4;
              });
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.star, color: Colors.indigo[700]),
          ),
        ],
      ),
    );
  }
}
