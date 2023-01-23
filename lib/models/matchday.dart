class Matchday {
  String? homeLogo;
  String? homeTeam;
  String? awayLogo;
  String? awayTeam;
  String? homeTeamScore;
  String? awayTeamScore;

  Matchday(
      {this.homeLogo,
      this.homeTeam,
      this.awayLogo,
      this.awayTeam,
      this.homeTeamScore,
      this.awayTeamScore});

  Matchday.fromJson(Map<String, dynamic> json) {
    homeLogo = json['homeLogo'];
    homeTeam = json['homeTeam'];
    awayLogo = json['awayLogo'];
    awayTeam = json['awayTeam'];
    homeTeamScore = json['homeTeamScore'];
    awayTeamScore = json['awayTeamScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homeLogo'] = this.homeLogo;
    data['homeTeam'] = this.homeTeam;
    data['awayLogo'] = this.awayLogo;
    data['awayTeam'] = this.awayTeam;
    data['homeTeamScore'] = this.homeTeamScore;
    data['awayTeamScore'] = this.awayTeamScore;
    return data;
  }
}