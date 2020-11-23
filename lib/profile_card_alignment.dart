import 'package:flutter/material.dart';

class ProfileCardAlignment extends StatelessWidget {
  final int cardNum;
  final String bio;

  final String firstName;
  final String age;
  final String imagePath;
  final String distance;

  // add a string variable for the image path
  // add a string variable for the bio
  // add a string variable for the age
  // add a string variable for the first name

  //ADD A SCROLLABLE OBJECT FOR IMAGES TO SCROLL SIDEWAYS
  //WHEN PRESSED SHOW BIO
  //MAKE IT ROUNDER INSTEAD OF BOXED

  ProfileCardAlignment({
    this.cardNum,
    this.bio = "Swipe right and I'll text you first :P\n1\n2\n3\n4",
    this.firstName = "Claire",
    this.age = "22",
    this.imagePath = 'res/anonymous-user.png',
    this.distance = '34',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Stack(
        children: <Widget>[
          // Scrollable(viewportBuilder: null),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$firstName \t$age\t', //$cardNum',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '$distance km away', //$cardNum',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8.0)),
                  Text(bio,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
