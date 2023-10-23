import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttering/Screens/ReviewScreen.dart';
import 'package:fluttering/core/domain/entities/AppointmentOptions.dart';
import 'package:fluttering/core/domain/entities/Availability.dart';
import 'package:fluttering/core/domain/entities/DoctorDetails.dart';
import 'package:fluttering/core/domain/repositories/BookingRepo.dart';
import 'package:fluttering/injection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectPackage extends StatefulWidget {
  final DoctorDetails doctorDetails;
  final Availabilty availabilty;

  const SelectPackage({super.key, required this.doctorDetails, required this.availabilty});

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
  var dropdownvalue = "";
  var selectedPackage = 0;
  IconData iconSelector(String message){
    if(message=="Messaging")return Icons.message;
    if(message=="Voice Call")return FontAwesomeIcons.phone;
    if(message=="Video Call")return FontAwesomeIcons.video;
    return FontAwesomeIcons.solidUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Package",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<AppointmentOptions>(
        future: getIt<BookingRepo>().fetchAppointmentOptions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            AppointmentOptions appointmentOptions = snapshot.data!;
            var items = appointmentOptions.duration;
            var packages = appointmentOptions.package;
            if (dropdownvalue == "") dropdownvalue = items[0];
            return Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("Select Duration",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                  DropdownButtonFormField(
                    // Initial Value
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.timer, color: Colors.blue),
                  ),
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  const Row(
                    children: [
                      Text("Select Package",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: packages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            width: MediaQuery.of(context).size.width*0.1,
                            height: MediaQuery.of(context).size.width*0.2,
                            child: Center(
                              child: RadioListTile(

                                value: index,
                                groupValue: selectedPackage,

                                onChanged: (value) {
                                  setState(() {
                                    selectedPackage = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.trailing,
                                title:
                                Row(
                                  children: <Widget>[
                                     Expanded(
                                      flex: 1,
                                      child: CircleAvatar(
                                        // backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          // backgroundColor: const Color(0xffE6E6E6),
                                          radius: MediaQuery.of(context).size.width * 0.1,
                                          child:  FaIcon(
                                            iconSelector(packages[index]),
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        packages[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: const TextStyle(color: Colors.black, fontSize: 16.0),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const Divider(),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.3))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReviewScreen(
                                  doctorDetails: widget.doctorDetails,
                              availabilty: widget.availabilty,
                              duration: dropdownvalue,
                              package: packages[selectedPackage],
                                )));
                      },
                      child: const Text("Next",style: TextStyle(color: Colors.white),))
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
