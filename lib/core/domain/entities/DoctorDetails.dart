import 'Availability.dart';
import 'Slot.dart';

class DoctorDetails {
  final String doctorName;
  final String image;
  final String speciality;
  final String location;
  final int patientsServed;
  final int yearsOfExperience;
  final double rating;
  final int numberOfReviews;
  final List<Availabilty> availability;

//<editor-fold desc="Data Methods">
  const DoctorDetails({
    required this.doctorName,
    required this.image,
    required this.speciality,
    required this.location,
    required this.patientsServed,
    required this.yearsOfExperience,
    required this.rating,
    required this.numberOfReviews,
    required this.availability,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorDetails &&
          runtimeType == other.runtimeType &&
          doctorName == other.doctorName &&
          image == other.image &&
          speciality == other.speciality &&
          location == other.location &&
          patientsServed == other.patientsServed &&
          yearsOfExperience == other.yearsOfExperience &&
          rating == other.rating &&
          numberOfReviews == other.numberOfReviews &&
          availability == other.availability);

  @override
  int get hashCode =>
      doctorName.hashCode ^
      image.hashCode ^
      speciality.hashCode ^
      location.hashCode ^
      patientsServed.hashCode ^
      yearsOfExperience.hashCode ^
      rating.hashCode ^
      numberOfReviews.hashCode ^
      availability.hashCode;

  @override
  String toString() {
    return 'DoctorDetails{ doctor_name: $doctorName, image: $image, speciality: $speciality, location: $location, patients_served: $patientsServed, years_of_experience: $yearsOfExperience, rating: $rating, number_of_reviews: $numberOfReviews, availabilty: $availability,}';
  }

  DoctorDetails copyWith({
    String? doctor_name,
    String? image,
    String? speciality,
    String? location,
    int? patients_served,
    int? years_of_experience,
    double? rating,
    int? number_of_reviews,
    List<Availabilty>? availability,
  }) {
    return DoctorDetails(
      doctorName: doctor_name ?? this.doctorName,
      image: image ?? this.image,
      speciality: speciality ?? this.speciality,
      location: location ?? this.location,
      patientsServed: patients_served ?? this.patientsServed,
      yearsOfExperience: years_of_experience ?? this.yearsOfExperience,
      rating: rating ?? this.rating,
      numberOfReviews: number_of_reviews ?? this.numberOfReviews,
      availability: availability ?? this.availability,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctor_name': this.doctorName,
      'image': this.image,
      'speciality': this.speciality,
      'location': this.location,
      'patients_served': this.patientsServed,
      'years_of_experience': this.yearsOfExperience,
      'rating': this.rating,
      'number_of_reviews': this.numberOfReviews,
      'availability': this.availability,
    };
  }

  factory DoctorDetails.fromMap(Map<String, dynamic> map) {
    List<Availabilty> availabilties = [];
    Map<String, dynamic> mp = map['availability'];
    mp.forEach((key, value) {
      List<String> vals = value.cast<String>();
      List<Slot> slots = [];
      vals.forEach((element) {
        slots.add(Slot.fromString(element));
      });
      availabilties
          .add(Availabilty(dateTime: DateTime.parse(key), slots: slots));
    });

    return DoctorDetails(
      doctorName: map['doctor_name'] as String,
      image: map['image'] as String,
      speciality: map['speciality'] as String,
      location: map['location'] as String,
      patientsServed: map['patients_served'] as int,
      yearsOfExperience: map['years_of_experience'] as int,
      rating: map['rating'] as double,
      numberOfReviews: map['number_of_reviews'] as int,
      availability: availabilties,
    );
  }

//</editor-fold>
}
