// ignore_for_file: non_constant_identifier_names

class Team
{
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String full_name;
  final String name;

  Team
  (
    {
      required this.id,
      required this.abbreviation,
      required this.city,
      required this.conference,
      required this.division,
      required this.full_name,
      required this.name,
    }
  );

  static Team fromSnap(var eachTeam) 
  {
    return Team
    (
      id: eachTeam['id'], 
      abbreviation: eachTeam['abbreviation'], 
      city: eachTeam['city'], 
      conference: eachTeam['conference'], 
      division: eachTeam['division'], 
      full_name: eachTeam['full_name'], 
      name: eachTeam['name'],
    );
  }

}