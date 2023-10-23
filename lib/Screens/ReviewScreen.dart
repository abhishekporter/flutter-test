import 'package:flutter/material.dart';
import 'package:fluttering/Screens/BookingConfirmation.dart';
import 'package:fluttering/core/domain/entities/Availability.dart';
import 'package:fluttering/core/domain/entities/DoctorDetails.dart';
import 'package:fluttering/widgets/DoctorWidget.dart';

class ReviewScreen extends StatelessWidget {
  final DoctorDetails doctorDetails;
  final Availabilty availabilty;
  final String package;
  final String duration;

  const ReviewScreen({super.key, required this.doctorDetails, required this.availabilty, required this.package, required this.duration});

  String getMonthName(int month){
    List<String> months=['January','February','March','April','May','June','July','August','September','October','November','December'];
    return months[month-1];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Review Summary",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
        child: Column(
          children: [
            DoctorWidget(doctorDetails: doctorDetails),
            const Divider(),
            Row(
              children: [
                Text("Date & Hour",style: TextStyle(color: Colors.grey),),
                Spacer(),
                Text("${getMonthName(availabilty.dateTime.month)} ${availabilty.dateTime.day},${availabilty.dateTime.year} | ${availabilty.slots.first.start}"),
              ],
            ),
            Row(
              children: [
                Text("Package",style: TextStyle(color: Colors.grey),),
                Spacer(),
                Text("$package"),
              ],
            ),
            Row(
              children: [
                Text("Duration",style: TextStyle(color: Colors.grey),),
                Spacer(),
                Text("$duration"),
              ],
            ),
            const Row(
              children: [
                Text("Booking For",style: TextStyle(color: Colors.grey),),
                Spacer(),
                Text("Self"),
              ],
            ),
            Spacer(),
            Divider(),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width * 0.3))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  const BookingConfirmationScreen(

                      )));
                },
                child: const Text("Confirm",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
