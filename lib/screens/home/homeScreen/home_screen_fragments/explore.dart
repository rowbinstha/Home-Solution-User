import 'package:flutter/material.dart';
import 'explore_body.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDBDFAA),
              Color(0xFFF7F6FF),
            ],
          )),
          child: Column(
            children: [
              //showing the header
              Container(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 24,
                  ),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey there!",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text("Good Morning:)")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //showing the body
              const SingleChildScrollView(child: ExploreBody()),
            ],
          ),
        ),
      ),
    );
  }
}
