import 'package:flutter/material.dart';
import 'package:iclean/ui/homepage.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int screenIndex = 1;
  List<Color> screenColors = [
    Color.fromARGB(255, 66, 184, 178),
    Color.fromARGB(255, 182, 131, 250),
    Color.fromARGB(255, 255, 150, 89),
    Color.fromARGB(255, 95, 212, 228),
    Color.fromARGB(255, 245, 146, 204)
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: size.height * 0.6,
                width: size.width,
                color: screenColors[screenIndex - 1],
              )),
          const Positioned(
            top: -20,
            left: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              radius: 50,
            ),
          ),
          Positioned(
            top: size.height / 3,
            left: size.width - 50,
            child: const CircleAvatar(
              backgroundColor: Colors.white24,
              radius: 35,
            ),
          ),
          const Positioned(
            top: 150,
            left: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              radius: 15,
            ),
          ),
          const Positioned(
            top: 85,
            right: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              radius: 15,
            ),
          ),
          Positioned(
            top: 270,
            right: size.width / 2,
            child: const CircleAvatar(
              backgroundColor: Colors.white24,
              radius: 12,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 115),
                      const Text("Clean Home",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'UbuntuMed')),
                      const SizedBox(height: 10),
                      const Text(
                        "Clean Life",
                        style: TextStyle(fontSize: 25, color: Colors.white,fontFamily: 'UbuntuMed'),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                        style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'UbuntuMed'),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 135),
                      Image.asset(
                        'assets/images/intro/intro2.png',
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: const Center(
                                child: Text("Start",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17, fontFamily: 'UbuntuMed')),
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          screenIndex <= 1
                              ? const Text('')
                              : IconButton(
                                  onPressed: () => {
                                        // if (screenIndex >= 1)
                                        setState(() {
                                          screenIndex -= 1;
                                        })
                                      },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                  )),
                          screenIndex >= 5
                              ? const Text('')
                              : IconButton(
                                  onPressed: () => {
                                        // if (screenIndex < 5)
                                        setState(() {
                                          screenIndex += 1;
                                        })
                                      },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                  ))
                        ],
                      )
                    ])),
          )
        ]));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h - 200);
    path.quadraticBezierTo(w * 0.1, h * 0.5, w * 0.2, h * 0.68);
    path.quadraticBezierTo(w * 0.3, h * 0.9, w * 0.6, h * 0.7);
    path.quadraticBezierTo(w * 0.7, h * 0.65, w, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
