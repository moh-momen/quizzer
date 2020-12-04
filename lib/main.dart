import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Quizer.dart';

void main() => runApp(MyQuiz());

class MyQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quizzer"),
        ),
        backgroundColor: Colors.grey.shade500,
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 color: Colors.green,
//                 width: 500,
//
// //              width: MediaQuery.of(context,
// //                 height: 200,
//                 child: Center(child: Text("True of False questions", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
//               ),
//             ),
//             Expanded(
//               child: Container(
//              width: 500,
// //                 height: 500,
//                 color: Colors.teal,
//              // height: MediaQuery.of(context).size.height / 3,
//                 child: Center(child: Text("multiple-choice  questions", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
//               ),
//             )
//           ],
//         ),
        body:  Quizer(),
      ),
    );
  }
}
