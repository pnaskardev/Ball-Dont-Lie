class Matchday 
{
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

  Matchday.fromJson(Map<String, dynamic> json) 
  {
    homeLogo = json['homeLogo'];
    homeTeam = json['homeTeam'];
    awayLogo = json['awayLogo'];
    awayTeam = json['awayTeam'];
    homeTeamScore = json['homeTeamScore'];
    awayTeamScore = json['awayTeamScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['homeLogo'] = homeLogo;
    data['homeTeam'] = homeTeam;
    data['awayLogo'] = awayLogo;
    data['awayTeam'] = awayTeam;
    data['homeTeamScore'] = homeTeamScore;
    data['awayTeamScore'] = awayTeamScore;
    return data;
  }
}