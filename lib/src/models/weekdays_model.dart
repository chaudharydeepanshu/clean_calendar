class Weekdays {
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;

  const Weekdays({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weekdays &&
          runtimeType == other.runtimeType &&
          sunday == other.sunday &&
          monday == other.monday &&
          tuesday == other.tuesday &&
          wednesday == other.wednesday &&
          thursday == other.thursday &&
          friday == other.friday &&
          saturday == other.saturday;

  @override
  int get hashCode =>
      sunday.hashCode ^
      monday.hashCode ^
      tuesday.hashCode ^
      wednesday.hashCode ^
      thursday.hashCode ^
      friday.hashCode ^
      saturday.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'Weekdays{sunday: $sunday, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday}';
  }
}
