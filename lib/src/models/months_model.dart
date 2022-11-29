class Months {
  final String january;
  final String february;
  final String march;
  final String april;
  final String may;
  final String june;
  final String july;
  final String august;
  final String september;
  final String october;
  final String november;
  final String december;

  const Months({
    required this.january,
    required this.february,
    required this.march,
    required this.april,
    required this.may,
    required this.june,
    required this.july,
    required this.august,
    required this.september,
    required this.october,
    required this.november,
    required this.december,
  });

  Map<String, dynamic> toMap() {
    return {
      'january': january,
      'february': february,
      'march': march,
      'april': april,
      'may': may,
      'june': june,
      'july': july,
      'august': august,
      'september': september,
      'october': october,
      'november': november,
      'december': december,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Months &&
          runtimeType == other.runtimeType &&
          january == other.january &&
          february == other.february &&
          march == other.march &&
          april == other.april &&
          may == other.may &&
          june == other.june &&
          july == other.july &&
          august == other.august &&
          september == other.september &&
          october == other.october &&
          november == other.november &&
          december == other.december;

  @override
  int get hashCode =>
      january.hashCode ^
      february.hashCode ^
      march.hashCode ^
      april.hashCode ^
      may.hashCode ^
      june.hashCode ^
      july.hashCode ^
      august.hashCode ^
      september.hashCode ^
      october.hashCode ^
      november.hashCode ^
      december.hashCode;

  // Implement toString to make it easier to see information
  // when using the print statement.
  @override
  String toString() {
    return 'Months{january: $january, february: $february, march: $march, april: $april, may: $may, june: $june, july: $july, august: $august, september: $september, october: $october, november: $november, december: $december}';
  }
}
