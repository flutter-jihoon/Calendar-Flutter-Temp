enum CalendarFontSize {
  small('작게'),
  medium('중간'),
  large('크게');

  final String description;
  const CalendarFontSize(this.description);
}

enum CalendarTimeFormat {
  amPm('오후 1:00'),
  twentyFourHour('13:00');

  final String description;
  const CalendarTimeFormat(this.description);
}

enum CalendarFirstDayOfWeek {
  saturday('토'),
  sunday('일'),
  monday('월');

  final String description;
  const CalendarFirstDayOfWeek(this.description);
}
