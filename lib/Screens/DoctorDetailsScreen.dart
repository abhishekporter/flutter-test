import 'package:flutter/material.dart';
import 'package:fluttering/Screens/BookingScreen.dart';
import 'package:fluttering/core/domain/entities/Appointment.dart';
import 'package:fluttering/core/domain/repositories/BookingRepo.dart';
import 'package:fluttering/injection.dart';

import '../core/domain/entities/DoctorDetails.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DoctorDetails",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<List<DoctorDetails>>(
        future: getIt<BookingRepo>().fetchDoctorDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DoctorDetails> doctorDetails = snapshot.data!;
            return ListView.builder(
                itemCount: doctorDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(doctorDetails[index].image),
                    title: Text(doctorDetails[index].doctorName),
                    subtitle: Text(doctorDetails[index].speciality),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookingScreen(
                                doctorDetail: doctorDetails[index],
                              )));
                    },
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
