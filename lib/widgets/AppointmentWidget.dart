import 'package:flutter/material.dart';
import 'package:fluttering/core/domain/entities/Appointment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppointmentWidget extends StatelessWidget {
  final Appointment appointment;

  const AppointmentWidget({super.key, required this.appointment});

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

  String timeSelector(String time) {
    String res = time.split(" - ")[0];

    return res;
  }

  String getTime() {
    return "${getMonthName(appointment.appointmentDate.month)} ${appointment.appointmentDate.day}, - ${timeSelector(appointment.appointmentTime)}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(getTime(), style: TextStyle(fontWeight: FontWeight.bold)),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffE6E6E6),
                  radius: MediaQuery.of(context).size.width * 0.1,
                  child: const Icon(
                    Icons.people,
                    color: Color(0xffCCCCCC),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(appointment.doctorName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.blue.shade400,
                      ),
                      Text(appointment.location,
                          style: TextStyle(color: Colors.grey)),
                      // const Icon(Icons.map_rounded)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.squarePen,
                        color: Colors.blue.shade400,
                      ),
                      const Text("Booking ID:",
                          style: TextStyle(color: Colors.grey)),
                      Text(
                        "#${appointment.bookingId!}",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.lightBlueAccent.shade100),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.08)),
                  ),
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.blue))),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.08))),
                  child: const Text("Reschedule",
                      style: TextStyle(color: Colors.white)))
            ],
          )
        ],
      ),
    );
  }
}
