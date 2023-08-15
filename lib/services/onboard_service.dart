// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hs_frontend/screens/home/dashboard_screen.dart';
// import 'package:hs_frontend/screens/log_in/screen/log_in_screen.dart';
// import 'package:hs_frontend/services/session_manager.dart';

// class OnBoardService {
//   void isLogin(BuildContext context) {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     final user = auth.currentUser;

//     if (user != null) {
//       SessionService().userId = user.uid.toString();
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const DashboardScreen()),
//       );
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const LogInScreen()),
//       );
//     }
//   }
// }
