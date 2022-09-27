int getEndWeekdayFromStartWeekday({required int startWeekday}) {
  final int endWeekday;
  int temp = startWeekday;
  for (int i = 2; i <= 7; i++) {
    temp = temp + 1;
    if (temp == 7 && i != 7) {
      temp = 0;
    }
  }
  endWeekday = temp;
  return endWeekday;
}
