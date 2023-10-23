import 'dart:convert';

import 'package:fluttering/core/domain/entities/Appointment.dart';
import 'package:fluttering/core/domain/entities/AppointmentOptions.dart';
import 'package:fluttering/core/domain/entities/DoctorDetails.dart';
import 'package:fluttering/core/domain/repositories/BookingRepo.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: BookingRepo)
class ApiBookingRepo extends BookingRepo {
  @override
  Future<List<DoctorDetails>>? fetchDoctorDetails() async {
    // TODO: implement fetchDoctorDetails
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors'));

    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body) as List;
      List<DoctorDetails> expectedRes = [];
      for (int i = 0; i < result.length; i++) {
        expectedRes.add(DoctorDetails.fromMap(result[i]));
      }
      return expectedRes;
    } else {
      throw Exception('Failed to load album');
    }
    throw UnimplementedError();
  }

  @override
  Future<AppointmentOptions>? fetchAppointmentOptions() async {
    // TODO: implement fetchAppointmentOptions
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointment_options'));

    if (response.statusCode == 200) {
      return AppointmentOptions.fromMap(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<List<Appointment>>? fetchBookings() async {
    // TODO: implement fetchBookings
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointments'));

    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body) as List;
      List<Appointment> expectedRes = [];
      for (int i = 0; i < result.length; i++) {
        expectedRes.add(Appointment.fromMap(result[i]));
      }
      return expectedRes;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<Appointment> fetchAppointment() async {
    // TODO: implement fetchAppointment
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/githubforekam/doctor-appointment/booking_confirmation'));

    if (response.statusCode == 200) {
      return Appointment.fromMap(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
