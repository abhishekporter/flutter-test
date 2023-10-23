class Appointment {
  final String? bookingId;
  final String doctorName;
  final String location;
  final DateTime appointmentDate;
  final String appointmentTime;

//<editor-fold desc="Data Methods">
  const Appointment({
    this.bookingId,
    required this.doctorName,
    required this.location,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appointment &&
          runtimeType == other.runtimeType &&
          bookingId == other.bookingId &&
          doctorName == other.doctorName &&
          location == other.location &&
          appointmentDate == other.appointmentDate &&
          appointmentTime == other.appointmentTime);

  @override
  int get hashCode =>
      bookingId.hashCode ^
      doctorName.hashCode ^
      location.hashCode ^
      appointmentDate.hashCode ^
      appointmentTime.hashCode;

  @override
  String toString() {
    return 'Appointment{ booking_id: $bookingId, doctor_name: $doctorName, location: $location, appointment_date: $appointmentDate, appointment_time: $appointmentTime,}';
  }

  Appointment copyWith({
    String? booking_id,
    String? doctor_name,
    String? location,
    DateTime? appointment_date,
    String? appointment_time,
  }) {
    return Appointment(
      bookingId: booking_id ?? this.bookingId,
      doctorName: doctor_name ?? this.doctorName,
      location: location ?? this.location,
      appointmentDate: appointment_date ?? this.appointmentDate,
      appointmentTime: appointment_time ?? this.appointmentTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'booking_id': this.bookingId,
      'doctor_name': this.doctorName,
      'location': this.location,
      'appointment_date': this.appointmentDate,
      'appointment_time': this.appointmentTime,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      bookingId: map['booking_id'] as String?,
      doctorName: map['doctor_name'] as String,
      location: map['location'] as String,
      appointmentDate: DateTime.parse(map['appointment_date'] ),
      appointmentTime: map['appointment_time'] as String,
    );
  }

//</editor-fold>
}
