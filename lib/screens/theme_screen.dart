// import 'package:chat_app/screens/thememanager.dart';
// import 'package:flutter/material.dart';

// class ThemeView extends StatelessWidget {
//   const ThemeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ThemeManager _manager = ThemeManager();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Themes"),
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Switch(
//                       value: _manager.themeMode == ThemeMode.light,
//                       onChanged: (value) {
//                         _manager.toggleTheme(value);
//                       }),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, bottom: 5),
//                     child: Text(
//                       "Ligth",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Switch(
//                       value: _manager.themeMode == ThemeMode.dark,
//                       onChanged: (value) {
//                         _manager.toggleTheme(value);
//                       }),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, bottom: 5),
//                     child: Text(
//                       "Dark",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
