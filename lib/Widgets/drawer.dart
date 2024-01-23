// import 'package:flutter/material.dart';

// class DrawerScreen extends StatelessWidget {
//   const DrawerScreen({super.key});

//   Widget buildListTile(String title, IconData icon) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         size: 26,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           //fontFamily: 'RobotoCondensed',
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(30),
//             height: 100,
//             width: double.infinity,
//             padding: EdgeInsets.all(30.0),
//             alignment: Alignment.centerLeft,
//             child: const Text(
//               'Vlohy !',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w900,
//                 color: Color(0xFF04385D),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           buildListTile('Home', Icons.home),
//           buildListTile('Serivces', Icons.design_services_outlined),
//           buildListTile('Feedback', Icons.feedback),
//           buildListTile('Contact', Icons.contact_mail)
//         ],
//       ),
//     );
//   }
// }
