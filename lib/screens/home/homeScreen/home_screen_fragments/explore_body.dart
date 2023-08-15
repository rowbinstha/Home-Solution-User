import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExploreBody extends StatefulWidget {
  const ExploreBody({super.key});

  @override
  State<ExploreBody> createState() => _ExplorePageBodyState();
}

class _ExplorePageBodyState extends State<ExploreBody> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 240,
          child: PageView.builder(
            controller: pageController,
            itemCount: 3,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController, // PageController
          count: 3,
          effect: const WormEffect(
            activeDotColor: Color.fromARGB(249, 14, 8, 88),
            dotWidth: 8.0,
            dotHeight: 8.0,
          ),
          onDotClicked: (index) {},
        ),
        Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Templates",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF222034),
                        letterSpacing: 0.18,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: const Row(
                          children: [
                            Text(
                              "See more",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF3B3863),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
        Container(
          height: 500,
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Lorem Ipsum is simply",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "dummy text of the printing and typesetting",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add your Apply Now button logic here
                          },
                          child: Text("Apply Now"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your Read Manual button logic here
                          },
                          child: Text("Read Manual"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int position) {
    return Stack(
      children: [
        Container(
          height: 232,
          margin: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/images/plumber.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 43,
            margin: const EdgeInsets.only(
                left: 25, right: 34, bottom: 10, top: 120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Start Adventure Today",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 212,
            width: 200,
            margin: const EdgeInsets.only(
                left: 150, right: 20, bottom: 10, top: 32),
            child: const Text(
              "Let's Make Our Life so a Life",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
