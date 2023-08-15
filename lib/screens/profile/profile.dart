import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/log_in/screen/log_in_screen.dart';
import 'package:hs_frontend/services/profile_service.dart';
import 'package:hs_frontend/services/session_manager.dart';
import 'package:hs_frontend/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref('User');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 204, 242, 240),
      body: ChangeNotifierProvider(
        create: (_) => ProfileService(),
        child: Consumer<ProfileService>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: StreamBuilder(
                  stream: ref.child(SessionService().userId.toString()).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                child: Center(
                                  child: Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.teal.shade300,
                                            width: 3)),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: provider.image == null
                                            ? map['profile'].toString() == ""
                                                ? Icon(
                                                    Icons.person,
                                                    size: 35,
                                                  )
                                                : Image(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      map['profile'].toString(),
                                                    ),
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) return child;
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    },
                                                    errorBuilder: (context,
                                                        object, stack) {
                                                      return Container(
                                                        child: const Icon(
                                                          Icons.error_outline,
                                                          color: Colors.red,
                                                        ),
                                                      );
                                                    },
                                                  )
                                            : Image.file(
                                                File(provider.image!.path)
                                                    .absolute)),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  provider.pickImage(context);
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.teal.shade600,
                                  child: Icon(Icons.add,
                                      size: 25, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 80),
                          GestureDetector(
                            onTap: () {
                              provider.showUserNameDialogAlert(
                                  context, map['username']);
                            },
                            child: ReusableRow(
                                title: 'Username',
                                value: map['username'],
                                iconData: Icons.person_outlined),
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.showPhoneDialogAlert(
                                  context, map['phone']);
                            },
                            child: ReusableRow(
                                title: 'Phone',
                                value: map['phone'] == ''
                                    ? '98xxxxxxxx'
                                    : map['phone'],
                                iconData: Icons.phone_outlined),
                          ),
                          ReusableRow(
                              title: 'Email',
                              value: map['email'],
                              iconData: Icons.email_outlined),
                          SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            onPressed: () {
                              FirebaseAuth auth = FirebaseAuth.instance;

                              auth.signOut().then((value) {
                                SessionService().userId = '';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()),
                                );
                              });
                            },
                            buttonName: 'Logout',
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text('Something went wrong'));
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;

  const ReusableRow(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title:
              Text(title, style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Icon(
            iconData,
            color: Colors.black,
          ),
          trailing:
              Text(value, style: TextStyle(color: Colors.black, fontSize: 18)),
        ),
        Divider(
          color: Colors.grey.shade600,
        )
      ],
    );
  }
}
