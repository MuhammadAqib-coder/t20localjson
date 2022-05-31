class TeamModel {
  final String fullName;
  final String shortName;
  final String flag;

  TeamModel(
      {required this.fullName, required this.shortName, required this.flag});

  static TeamModel fromJson(map) {
    return TeamModel(
        fullName: map['fullName'],
        shortName: map['shortName'],
        flag: map['flag']);
  }
}
