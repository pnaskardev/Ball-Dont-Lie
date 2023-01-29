class FutureMatchday
{
  String? homeLogo;
  String? homeTeam;
  String? awayLogo;
  String? awayTeam;
  String? matchday;

  FutureMatchday
  ({
    this.homeLogo,
    this.homeTeam,
    this.awayLogo,
    this.awayTeam,
    this.matchday
  });

  FutureMatchday.fromJson(Map<String, dynamic> json)
  {
    homeLogo=json['homeLogo'];
    homeTeam=json['homeTeam'];
    awayLogo=json['awayLogo'];
    awayTeam=json['awayTeam'];
    matchday=json['MatchDay'];
  }

}