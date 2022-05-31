class ScheduleModel {
  final String date;
  final String teamOne;
  final String teamTwo;
  final String flagOne;
  final String flagTwo;
  final String group;
  final String venue;
  final String time;

  ScheduleModel(
      {required this.date,
      required this.teamOne,
      required this.teamTwo,
      required this.flagOne,
      required this.flagTwo,
      required this.group,
      required this.venue,
      required this.time});

  static ScheduleModel fromJson(map) {
    return ScheduleModel(
        date: map['date'],
        teamOne: map['teamOne'],
        teamTwo: map['teamTwo'],
        flagOne: map['flagOne'],
        flagTwo: map['flagTwo'],
        group: map['group'],
        venue: map['venue'],
        time: map['time']);
  }
}
