List<String> getWeekdaysListBasedOnStartWeekday(
    {required int startWeekday, required List<String> listOfWeekDaysSymbol}) {
  List<String> newListOfWeekDaysSymbol = [];
  for (int i = 0; i < 7; i++) {
    if (!(startWeekday - 1 + i > 6)) {
      newListOfWeekDaysSymbol.add(listOfWeekDaysSymbol[startWeekday - 1 + i]);
    }
  }
  for (int i = 0; newListOfWeekDaysSymbol.length < 7; i++) {
    newListOfWeekDaysSymbol.add(listOfWeekDaysSymbol[i]);
  }
  return newListOfWeekDaysSymbol;
}
