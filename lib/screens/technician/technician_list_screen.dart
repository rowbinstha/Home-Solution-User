import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/chat/message_screen.dart';
import 'package:hs_frontend/services/session_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TechnicianListScreen extends StatefulWidget {
  const TechnicianListScreen({super.key});

  @override
  State<TechnicianListScreen> createState() => _TechnicianListScreenState();
}

class _TechnicianListScreenState extends State<TechnicianListScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 242, 240),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('User List'),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            // hide currently login user
            if (SessionService().userId.toString() ==
                snapshot.child('uid').value.toString()) {
              return Container();
            } else {
              return Card(
                child: ListTile(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: MessageScreen(
                        name: snapshot.child('username').value.toString(),
                        image: snapshot.child('profile').value.toString(),
                        email: snapshot.child('email').value.toString(),
                        receiverId: snapshot.child('uid').value.toString(),
                      ),
                      withNavBar: false,
                    );
                  },
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    child: snapshot.child('profile').value.toString() == ''
                        ? Icon(Icons.person)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  snapshot.child('profile').value.toString()),
                            ),
                          ),
                  ),
                  title: Text(snapshot.child('username').value.toString()),
                  subtitle: Text(snapshot.child('email').value.toString()),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
