class HistoryModel {
  final String winner;
  final String runnerUp;
  final String host;
  final String winnerFlag;
  final String runnerUpFlag;
  final String year;

  HistoryModel(
      {required this.winner,
      required this.runnerUp,
      required this.host,
      required this.winnerFlag,
      required this.runnerUpFlag,
      required this.year});

  static HistoryModel fromJson(map)  {
    return HistoryModel(
        winner: map['winner'],
        runnerUp: map['runnerUp'],
        host: map['host'],
        winnerFlag: map['winnerFlag'],
        runnerUpFlag: map['runnerUpFlag'],
        year: map['year']);
  }
}
