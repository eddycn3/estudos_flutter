import 'package:flutter/material.dart';

void main() => runApp(MySecondApp());

class MySecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/eu.jpeg"),
              ),
              Text(
                "Eduardo C. Neto",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: "Pacifico",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Desenvolvedor Mobile".toUpperCase(),
                style: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 20.0,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+ 55 019992564678",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "SourceSansPro"),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "eddycn3@huhu.com",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "SourceSansPro"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
//                   children: <Widget>[
//                     Icon(
//                       Icons.email,
//                       color: Colors.teal,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       "eddycn3@huhu.com",
//                       style: TextStyle(
//                           color: Colors.teal.shade900,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           fontFamily: "SourceSansPro"),
//                     ),
//                   ],
//                 )

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   width: 100,
//                   color: Colors.red,
//                   child: Text(""),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       height: 100,
//                       width: 100,
//                       color: Colors.yellow,
//                       child: Text(""),
//                     ),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       color: Colors.green,
//                       child: Text(""),
//                     )
//                   ],
//                 ),
//                 Container(
//                   width: 100,
//                   color: Colors.blue,
//                   child: Text(""),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
