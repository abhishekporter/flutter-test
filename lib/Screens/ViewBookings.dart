import 'package:flutter/material.dart';
import 'package:fluttering/core/domain/entities/Appointment.dart';
import 'package:fluttering/core/domain/repositories/BookingRepo.dart';
import 'package:fluttering/injection.dart';
import 'package:fluttering/widgets/AppointmentWidget.dart';

class ViewBookings extends StatelessWidget {
  const ViewBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "My Bookings",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Appointment>>(
            future: getIt<BookingRepo>().fetchBookings(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Appointment> appointments = snapshot.data!;
                return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: appointments.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return AppointmentWidget(
                          appointment: appointments[index]);
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
