import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/home/dashboard_screen.dart';
import 'package:hs_frontend/services/session_manager.dart';
import 'package:hs_frontend/utils/utils.dart';

class SignUpService with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signUp(
    BuildContext context,
    String userName,
    String email,
    String password,
  ) async {
    if (password.length < 6) {
      Utils.toastMessage('Password should be at least 6 characters long');
      return;
    }
    setLoading(true);
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionService().userId = value.user!.uid.toString();

        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'onlineStatus': 'noOne',
          'phone': '',
          'username': userName,
          'profile': ''
        }).then((value) {
          setLoading(false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
          Utils.toastMessage('Sign Up Successfully');
        }).onError((error, stackTrace) {
          setLoading(false);
        });
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
