import 'package:flutter/material.dart';

import '../core/domain/entities/DoctorDetails.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorDetails doctorDetails;

  const DoctorWidget({super.key, required this.doctorDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(doctorDetails.image),
              radius: MediaQuery.of(context).size.width * 0.17),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorDetails.doctorName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              doctorDetails.speciality,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: Colors.blue,
                ),
                Text(
                  doctorDetails.location,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Icon(
                  Icons.map_rounded,
                  color: Colors.blue,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
