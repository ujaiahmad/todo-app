// import 'package:flutter/material.dart';
// import 'package:todo_app/taskRow.dart';

// class Task {
//   List<Widget> taskWidgetList = [];
//   // void addWidgetintoList(String taskName) {
//   //   final key = UniqueKey(); // i dont understand this
//   //   taskWidgetList.add(CustomRowTask(
//   //     key: key,
//   //     taskName: taskName,
//   //     deleteWidgetCallback: () {
//   //       setState(() {
//   //         taskWidgetList.removeWhere((element) => element.key == key);
//   //         // taskWidgetList.removeAt(0);
//   //       });
//   //     },
//   //   ));
//   // }

//   // void addTaskintoList() {
//   //   // taskMap['de']
//   // }
// }
// List<Widget> taskWidgetList = [];

// void addWidgetintoList(String taskName) {
//     final key = UniqueKey(); // i dont understand this
//     taskWidgetList.add(CustomRowTask(
//       key: key,
//       taskName: taskName,
//       deleteWidgetCallback: () {
//         setState(() {
//           taskWidgetList.removeWhere((element) => element.key == key);
//           // taskWidgetList.removeAt(0);
//         });
//       },
//     ));
//   }


// //  Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Text(task),
// //         Spacer(),
// //         Checkbox(
// //           value: isComplete,
// //           onChanged: (value) {
// //             !isComplete;
// //           },
// //         ),
// //         IconButton(
// //             onPressed: () {
// //               taskList.remove(task);
// //               // taskWidgetList.remove(value)
// //             },
// //             icon: Icon(Icons.delete))
// //       ],
// //     );