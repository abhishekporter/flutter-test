import 'dart:ffi';

double adjust(String str) {
  List<String> res = str.split(" ");
  res[0]=res[0].replaceAll(":", ".");
  return double.parse(res[0]) + (res[1] == 'AM' ? 0 : 12);
}

class Slot {
  final double start;
  final double end;

//<editor-fold desc="Data Methods">
  const Slot({
    required this.start,
    required this.end,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Slot &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          end == other.end);

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  @override
  String toString() {
    return 'Slot{ start: $start, end: $end,}';
  }

  Slot copyWith({
    double? start,
    double? end,
  }) {
    return Slot(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
    };
  }

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      start: map['start'] as double,
      end: map['end'] as double,
    );
  }

//</editor-fold>



  factory Slot.fromString(String str) {
    List<String> times = str.split(" - ");
    return Slot(start: adjust(times[0]), end: adjust(times[1]));
  }
}
