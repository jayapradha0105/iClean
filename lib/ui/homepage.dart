import 'package:flutter/material.dart';
import 'package:iclean/ui/serviceRequest.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> bannerColors = [
    Color.fromARGB(255, 149, 228, 238),
    Color.fromARGB(255, 241, 170, 62),
    Color.fromARGB(255, 222, 130, 238)
  ];

  List<Color> offerColors = [
    Color.fromARGB(255, 252, 111, 93),
    Color.fromARGB(255, 42, 189, 164),
    Color.fromARGB(255, 103, 134, 233)
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double serviceWidth = size.width * 0.3;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: const Text("iClean", style: TextStyle(fontFamily: 'Ubuntu')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: size.width * 0.75,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfff1f3f3)),
                      child: TextField(
                        style: const TextStyle(fontFamily: 'Ubuntu'),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              onPressed: () => {print("pressed search")},
                            ),
                            hintText: 'Search..',
                            hintStyle: const TextStyle(
                                fontSize: 15, color: Colors.grey, fontFamily: 'Ubuntu')),
                      )),
                  Container(
                    width: 45,
                    height: 45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/images/avatar.png'),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Container(
                  height: 120,
                  child:  ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                              width: size.width * 0.75,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: bannerColors[index]),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 15),
                                          const Text("Clothes Washing",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu')),
                                          const SizedBox(height: 5),
                                          const Text("Every Sunday",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Ubuntu',
                                                  color: Color.fromARGB(
                                                      255, 117, 108, 108))),
                                          const SizedBox(height: 10),
                                          Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.black),
                                              child: const Center(
                                                child: Text("Next",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily: 'Ubuntu')),
                                              ))
                                        ]),
                                    Image.asset(
                                      'assets/images/homeIconColor/washing.png',
                                      height: 70,
                                      width: 70,
                                    ),
                                  ]));
                        },
                  )),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  serviceBox(serviceWidth, 'cleaning', 'Cleaning'),
                  Container(width: 1, height: 90, color: Colors.grey),
                  serviceBox(serviceWidth, 'plumbing', 'Plumbing'),
                  Container(width: 1, height: 90, color: Colors.grey),
                  serviceBox(serviceWidth, 'painting', 'Painting'),
                ],
              ),
              Container(height: 1, width: size.width, color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  serviceBox(serviceWidth, 'electrician', 'Electrical'),
                  Container(width: 1, height: 90, color: Colors.grey),
                  serviceBox(serviceWidth, 'washing', 'Wash & Fold'),
                  Container(width: 1, height: 90, color: Colors.grey),
                  Container(
                      height: 100,
                      width: serviceWidth,
                      child: Column(
                        children: const [
                          SizedBox(height: 15),
                          Text(
                            "...",
                            style: TextStyle(fontSize: 30, fontFamily: 'Ubuntu'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "More",
                            style: TextStyle(fontSize: 15, fontFamily: 'Ubuntu'),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(height: 25),
              Container(
                  height: size.height * 0.28,
                  child:  ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            width: size.width * 0.35,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: offerColors[index]),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  const Text("Amazing offers",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  const Text("Everyday",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white54,
                                          fontFamily: 'Ubuntu')),
                                  const SizedBox(height: 65),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    child: const Text("See All",
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                            color: Colors.white, fontSize: 13)),
                                  )
                                ]),
                          );
                        }),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceBox(double serviceWidth, String imgName, String serviceName) {
    return InkWell(
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServiceRequest()),
              )
            },
        child: Container(
            height: 100,
            width: serviceWidth,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/homeIconColor/$imgName.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  serviceName,
                  style: const TextStyle(fontSize: 15, fontFamily: 'Ubuntu'),
                )
              ],
            )));
  }
}
