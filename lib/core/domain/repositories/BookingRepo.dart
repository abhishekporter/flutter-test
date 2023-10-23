import 'package:fluttering/core/domain/entities/Appointment.dart';
import 'package:fluttering/core/domain/entities/AppointmentOptions.dart';
import 'package:fluttering/core/domain/entities/DoctorDetails.dart';

abstract class BookingRepo {
  Future<List<DoctorDetails>>? fetchDoctorDetails();

  Future<AppointmentOptions>? fetchAppointmentOptions();

  Future<List<Appointment>>? fetchBookings();

  Future<Appointment> fetchAppointment();
}
