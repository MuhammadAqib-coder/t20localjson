import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_twenty/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("on Bording"),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              title: "First Page",
              body: "Description",
              footer: ElevatedButton(
                onPressed: () {},
                child: const Text("Let's Go"),
              ),
              image: Image.asset("assets/introScreen/profile_pic.png"),
              decoration: const PageDecoration(
                  titleTextStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          PageViewModel(
              title: "Second Page",
              body: "Description",
              footer: ElevatedButton(
                onPressed: () {},
                child: const Text("Let's Go"),
              ),
              image: Image.asset("assets/introScreen/map.png"),
              decoration: const PageDecoration(
                  titleTextStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          PageViewModel(
              title: "Third Page",
              body: "Description",
              footer: ElevatedButton(
                onPressed: () {},
                child: const Text("Let's Go"),
              ),
              image: Image.asset("assets/introScreen/download.png"),
              decoration: const PageDecoration(
                  titleTextStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold)))
        ],
        dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.blue,
            activeColor: Colors.red,
            activeSize: Size.square(15)),
        showDoneButton: true,
        done: const Text(
          "Done",
          style: TextStyle(fontSize: 20),
        ),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(fontSize: 20),
        ),
        showNextButton: true,
        next: const Icon(Icons.arrow_forward),
        onDone: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("ON_BOARDING", false);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        },
        curve: Curves.bounceOut,
      ),
    );
  }
}
