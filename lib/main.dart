// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const UserInput(),
//     );
//   }
// }

// class UserInput extends StatefulWidget {
//   const UserInput({Key? key}) : super(key: key);

//   @override
//   _UserInputState createState() => _UserInputState();
// }

// class _UserInputState extends State<UserInput> {
//   late TextEditingController textEditingController;
//   @override
//   void initState() {
//     textEditingController = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.redAccent,
//       appBar: AppBar(
//         title: const Text(
//           "DIAMOND PATTERN",
//           style: TextStyle(
//             color: Colors.deepOrange,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.brown,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 2.5,
//             height: 100,
//             child: Form(
//               child: TextField(
//                 controller: textEditingController,
//                 textAlign: TextAlign.center,
//                 decoration: const InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white, width: 5.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 5.0),
//                   ),
//                   hintStyle: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   hintText: 'Enter Number to Print Diamond Pattern',
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.teal,
//                 onPrimary: Colors.white,
//                 side: const BorderSide(color: Colors.black, width: 1),
//                 elevation: 20,
//                 minimumSize: const Size(120, 50),
//                 shape: const BeveledRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5))),
//               ),
//               onPressed: () {
//                 if (textEditingController.text.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       behavior: SnackBarBehavior.floating,
//                       backgroundColor: Colors.purple,
//                       content: Text(
//                         'Field Must Enter ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       )));
//                 } else {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) {
//                       var userInput = int.parse(textEditingController.text);
//                       return Diamond(userInput);
//                     },
//                   ));
//                 }
//               },
//               child: const Text(
//                 'Calculate',
//                 style: TextStyle(
//                   color: Colors.purple,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ))
//         ]),
//       ),
//     );
//   }
// }

// class Diamond extends StatefulWidget {
//   const Diamond(this.userInput, {Key? key}) : super(key: key);
//   final int userInput;
//   @override
//   _DiamondState createState() => _DiamondState();
// }

// class _DiamondState extends State<Diamond> {
//   late int boxes;
//   late int row;
//   late int input;
//   @override
//   void initState() {
//     row = (2 * widget.userInput) - 1;
// // boxes = pow(row, 2).toInt();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.redAccent,
//         body: Center(
//             child: widget.userInput > 6
//                 ? Container(
//                     alignment: Alignment.centerRight,
//                     margin: EdgeInsets.symmetric(vertical: 20),
//                     height: double.infinity,
//                     width: double.infinity,
//                     color: Colors.purple,
//                     child: GridView.count(
//                       scrollDirection: Axis.horizontal,
//                       crossAxisCount: row,
//                       children: pattern(widget.userInput),
//                     ),
//                   )
//                 : Container(
//                     child: Column(children: [
//                       Expanded(child: SizedBox()),
//                       Expanded(
//                         flex: 2,
//                         child: GridView.count(
//                             crossAxisCount: row,
//                             children: pattern(widget.userInput)),
//                       ),
//                       Expanded(child: SizedBox()),
//                     ]),
//                   )),
//       ),
//     );
//   }

//   List<Widget> pattern(int userInput) {
//     var listWidget = <Widget>[];
//     int size = row;
// // int start1 = 0;
//     int start, end, mid;
//     int containerText = 0;
//     start = end = mid = size ~/ 2;
//     for (int row = 0; row < size; row++) {
// // start1++;
//       for (int col = 0; col < size; col++) {
//         if (col >= start && col <= end) {
//           if (col <= (start + end) / 2) {
//             containerText++;
//           } else {
//             containerText--;
//           }
//           listWidget.add(Container(
//             decoration: BoxDecoration(
//                 color: Colors.grey, border: Border.all(color: Colors.black)),
//             alignment: Alignment.center,
//             child: Text(
//               '$containerText',
//               style: const TextStyle(
//                 color: Colors.red,
//                 fontSize: 10.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ));
//         } else {
//           listWidget.add(const SizedBox());
//         }
//       }
//       if (row < mid) {
//         start--;
//         end++;
//       } else {
//         start++;
//         end--;
//       }
//       containerText = 0;
//     }
// // print(listWidget.length);
// // print(boxes);
//     return listWidget;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_tracker/view/core/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
