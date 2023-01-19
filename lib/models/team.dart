// ignore_for_file: non_constant_identifier_names

class Team
{
  final int position;
  final String squadLogo;
  final String name;
  final int points;
  final int played;
  final int winned;
  final int loosed;
  final int tie;
  final int goalDifference;
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

  static Team fromSnap(var eachTeam) 
  {
    return Team
    (
      position: eachTeam['Position'], 
      squadLogo: eachTeam['SquadLogo'], 
      name: eachTeam['Name'], 
      points: eachTeam['Points'], 
      played: eachTeam['Played'], 
      winned: eachTeam['Winned'], 
      loosed: eachTeam['Loosed'],
      tie: eachTeam['Tie'],
      goalDifference: eachTeam['Goal Difference']
    );
  }

}