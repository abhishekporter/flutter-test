import 'Slot.dart';

class Availabilty {
  final DateTime dateTime;
  final List<Slot> slots;

//<editor-fold desc="Data Methods">
  const Availabilty({
    required this.dateTime,
    required this.slots,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Availabilty &&
          runtimeType == other.runtimeType &&
          dateTime == other.dateTime &&
          slots == other.slots);

  @override
  int get hashCode => dateTime.hashCode ^ slots.hashCode;

  @override
  String toString() {
    return 'Availabilty{ dateTime: $dateTime, slots: $slots,}';
  }

  Availabilty copyWith({
    DateTime? dateTime,
    List<Slot>? slots,
  }) {
    return Availabilty(
      dateTime: dateTime ?? this.dateTime,
      slots: slots ?? this.slots,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': this.dateTime,
      'slots': this.slots,
    };
  }

  factory Availabilty.fromMap(Map<String, dynamic> map) {
    return Availabilty(
      dateTime: map['dateTime'] as DateTime,
      slots: map['slots'] as List<Slot>,
    );
  }

//</editor-fold>
}
