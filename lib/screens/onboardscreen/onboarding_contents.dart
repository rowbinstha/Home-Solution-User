class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Expert Electricians",
    image: "assets/images/electrician.png",
    desc: "Inspect and maintain electrical systems in various buildings.",
  ),
  OnboardingContents(
    title: "Craftsman of Woodwork",
    image: "assets/images/carpenter.png",
    desc: "A skilled woodworking professional using various techniques.",
  ),
  OnboardingContents(
    title: "Pipeline Pro",
    image: "assets/images/plumber.png",
    desc: "Maintain and install plumbing systems in various buildings.",
  ),
];
