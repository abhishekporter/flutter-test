class AppointmentOptions {
  final List<String> duration;
  final List<String> package;

//<editor-fold desc="Data Methods">
  const AppointmentOptions({
    required this.duration,
    required this.package,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentOptions &&
          runtimeType == other.runtimeType &&
          duration == other.duration &&
          package == other.package);

  @override
  int get hashCode => duration.hashCode ^ package.hashCode;

  @override
  String toString() {
    return 'AppointmentOptions{ duration: $duration, package: $package,}';
  }

  AppointmentOptions copyWith({
    List<String>? duration,
    List<String>? package,
  }) {
    return AppointmentOptions(
      duration: duration ?? this.duration,
      package: package ?? this.package,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'duration': this.duration,
      'package': this.package,
    };
  }

  factory AppointmentOptions.fromMap(Map<String, dynamic> map) {
    return AppointmentOptions(
      duration: map['duration'].cast<String>(),
      package: map['package'].cast<String>(),
    );
  }

//</editor-fold>
}
