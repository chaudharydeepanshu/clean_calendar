class Weekdays {
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;

  const Weekdays({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  Map<String, dynamic> toMap() {
    return {
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weekdays &&
          runtimeType == other.runtimeType &&
          monday == other.monday &&
          tuesday == other.tuesday &&
          wednesday == other.wednesday &&
          thursday == other.thursday &&
          friday == other.friday &&
          saturday == other.saturday &&
          sunday == other.sunday;

  @override
  int get hashCode =>
      monday.hashCode ^
      tuesday.hashCode ^
      wednesday.hashCode ^
      thursday.hashCode ^
      friday.hashCode ^
      saturday.hashCode ^
      sunday.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'Weekdays{monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday}';
  }
}
