import 'package:flutter/material.dart';

class ServiceRequest extends StatefulWidget {
  const ServiceRequest({Key? key}) : super(key: key);

  @override
  State<ServiceRequest> createState() => _ServiceRequestState();
}

class _ServiceRequestState extends State<ServiceRequest> {
  List<String> locations = ['Chennai', 'Bangalore', 'Hyderabad', 'Mumbai'];
  List<String> frequencies = ['Daily', 'Weekly', 'Monthly', 'Bi-Weekly'];
  late String selectedFrequency = '', selectedTime ='';
  List<String> times = ['7.00', '10.00', '14.00', '18.00'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.cyan,
        title: const Text("iClean", style:  TextStyle(fontFamily: 'Ubuntu')),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: size.height * 0.5,
            width: size.width,
            child: Image.asset('assets/images/serviceBG.jpg'),
          ),
          Container(
              width: size.width,
              height: size.height * 0.6,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 35),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Cleaning Service",
                        style: TextStyle(fontSize: 20.0, fontFamily: 'Ubuntu')),
                    const SizedBox(height: 30),
                    const Text("Where?", style: TextStyle(fontSize: 18.0, fontFamily: 'Ubuntu')),
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                isExpanded: true,
                                hint: const Text("Select city", style: TextStyle(fontFamily: 'Ubuntu')),
                                items: locations.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: const TextStyle(fontFamily: 'Ubuntu')),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    print("drop down menu item")))),
                    const SizedBox(height: 30),
                    const Text("Select Frequency",
                        style: TextStyle(fontSize: 18.0, fontFamily: 'Ubuntu')),
                    const SizedBox(height: 15),
                    Container(
                        height: 60,
                        child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: frequencies.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    child: Container(
                                      width: 100,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color:selectedFrequency == frequencies[index] ? 
                                              Colors.cyan: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: selectedFrequency ==
                                                  frequencies[index]
                                              ? Colors.cyan[200]
                                              : Colors.white),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 5),
                                      child: Center(
                                          child: Text(frequencies[index],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Ubuntu',
                                                  color: selectedFrequency ==
                                                          frequencies[index]
                                                      ? Colors.white
                                                      : Colors.black))),
                                    ),
                                    onTap: () => {
                                          setState(() {
                                            selectedFrequency =
                                                frequencies[index];
                                          })
                                        });
                              },
                        )),
                         const SizedBox(height: 30),
                    const Text("Work Time",
                        style: TextStyle(fontSize: 18.0, fontFamily: 'Ubuntu')),
                    const SizedBox(height: 15),
                    Container(
                        height: 60,
                        child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: times.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    child: Container(
                                      width: 100,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color:selectedTime == times[index] ? 
                                              Colors.cyan: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: selectedTime ==
                                                  times[index]
                                              ? Colors.cyan[200]
                                              : Colors.white),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 5),
                                      child: Center(
                                          child: Text(times[index],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Ubuntu',
                                                  color: selectedTime ==
                                                          times[index]
                                                      ? Colors.white
                                                      : Colors.black))),
                                    ),
                                    onTap: () => {
                                          setState(() {
                                            selectedTime =
                                                times[index];
                                          })
                                        });
                              },
                        ))
                  ]))
        ],
      )),
    );
  }
}
