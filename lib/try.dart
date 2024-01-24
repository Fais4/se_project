import 'package:flutter/material.dart';
import 'package:thirdpage/SecondPage.dart';

//list view child(In it own container) contain children not 1 child
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<dynamic> individuals = [
    {
      "name": "yasir",
      "age": 19,
      "id": 443
    },
    {
      "name": "ahmed",
      "age": 19,
      "id": 443
    },
{
      "name": "yoyo",
      "age": 19,
      "id": 445
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 21, 177),
      appBar: AppBar(
        title: Text("content site"),
        backgroundColor: Color.fromARGB(239, 246, 246, 248),
      ),
      body: Container(
        
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              child: Text(individuals[1]["name"],),
            ),
            Image.asset(
              "images/robert-lukeman-_RBcxo9AU-U-unsplash.jpg",
              fit: BoxFit.cover,
              width: 120,
              height: 120,
            ),
            Container(
              height: 120,
              width: 120,
              color: Color.fromARGB(255, 95, 32, 71),
            ),
            Container(
              height: 120,
              width: 120,
              color: Color.fromARGB(255, 184, 57, 57),
            ),
            Container(
              height: 120,
              width: 120,
              color: Color.fromARGB(255, 92, 39, 225),
            ),
            Container(
              height: 120,
              width: 120,
              color: Color.fromARGB(255, 128, 126, 132),
            )
          ],
        ),
      ),
    ));
  }
}

// Container(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(Radius.circular(0)),
//             border: Border.all(color: Colors.white, width:1), //painting the border
//             boxShadow:
//             [
//               BoxShadow(color: Colors.black45,offset: Offset(10, 5), spreadRadius: 3,blurRadius: 15),
//               //BoxShadow(color: Colors.white,offset: Offset(2, 2), spreadRadius: 3,blurRadius: 5)
//             ]
//           ),
//           width: 200,
//           height: 150,
//           //alignment: Alignment.center, 
//           //padding: EdgeInsets.all(14), //dimentions(inside)
//           margin: EdgeInsets.all(15), //(ouside)
          
//           child: Image.asset("images/robert-lukeman-_RBcxo9AU-U-unsplash.jpg",width: 500,fit: BoxFit.cover,),
          
//         ),
