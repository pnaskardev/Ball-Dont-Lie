// ignore_for_file: non_constant_identifier_names, unnecessary_this

class Team
{
  String? position;
  String? squadLogo;
  String? name;
  String? points;
  String? played;
  String? winned;
  String? loosed;
  String? tie;
  String? goalDifference;
  Team
  (
    {
      required this.position,
      required this.squadLogo,
      required this.name,
      required this.points,
      required this.played,
      required this.winned,
      required this.loosed,
      required this.tie,
      required this.goalDifference
    }
  );

  Team.fromJson(Map<String, dynamic> json) 
  {
    position = json['Position'];
    squadLogo = json['SquadLogo'];
    name = json['Name'];
    points = json['Points'];
    played = json['Played'];
    winned = json['Winned'];
    loosed = json['Loosed'];
    tie = json['Tie'];
    goalDifference = json['Goal Difference'];
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Position'] = this.position;
    data['SquadLogo'] = this.squadLogo;
    data['Name'] = this.name;
    data['Points'] = this.points;
    data['Played'] = this.played;
    data['Winned'] = this.winned;
    data['Loosed'] = this.loosed;
    data['Tie'] = this.tie;
    data['Goal Difference'] = this.goalDifference;
    return data;
  
  }

}