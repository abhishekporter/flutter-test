import 'package:flutter/material.dart';
import 'package:fluttering/Screens/DoctorDetailsScreen.dart';
import 'package:fluttering/Screens/ViewBookings.dart';
import 'package:fluttering/core/domain/entities/Appointment.dart';
import 'package:fluttering/core/domain/entities/DoctorDetails.dart';
import 'package:fluttering/core/domain/repositories/BookingRepo.dart';
import 'package:fluttering/injection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/domain/entities/Availability.dart';

class BookingConfirmationScreen extends StatelessWidget {
  // final DoctorDetails doctorDetails;
  // final Availabilty availability;

  const BookingConfirmationScreen({super.key});

  String getMonthName(int month) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  String dateFormatter(DateTime date) {
    String res = "${date.day} ${getMonthName(date.month)}, ${date.year}";
    return res;
  }

  String timeSelector(String time) {
    String res = time.split(" - ")[0];

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Confirmation",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<Appointment>(
        future: getIt<BookingRepo>().fetchAppointment(),
        builder: (BuildContext context, AsyncSnapshot<Appointment> snapshot) {
          if (snapshot.hasData) {
            Appointment appointment = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.25,
                      backgroundColor: Colors.white,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: Colors.blue,
                        size: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Appointment Confirmed!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const Text(
                    "You have successfully booked appointment with",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    appointment.doctorName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          // backgroundColor: Colors.white,
                          child: CircleAvatar(
                            // backgroundColor: const Color(0xffE6E6E6),
                            radius: MediaQuery.of(context).size.width * 0.1,
                            child: const FaIcon(
                              FontAwesomeIcons.solidUser,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        // const Icon(Icons.people),
                        // Text("${widget.doctorDetail.patientsServed}+"),
                        const Text(
                          "Patients",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.1,
                              child: const FaIcon(
                                FontAwesomeIcons.solidCalendarDays,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          // const Icon(Icons.people),
                          // Text("${widget.doctorDetail.patientsServed}+"),
                          Text(
                            dateFormatter(appointment.appointmentDate),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      // Spacer(),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffE6E6E6),
                              radius: MediaQuery.of(context).size.width * 0.1,
                              child: const FaIcon(
                                FontAwesomeIcons.stopwatch,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          // const Icon(Icons.people),
                          // Text("${widget.doctorDetail.patientsServed}+"),
                          Text(
                            timeSelector(appointment.appointmentTime),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Divider(),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.2))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ViewBookings()));
                      },
                      child: const Text(
                        "View Appointments",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DoctorDetailsScreen()));
                      },
                      child: const Text(
                        "Book Another",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
        // child: ,
      ),
    );
  }
}
