import 'package:ball_dont_lie/models/future_matchday.dart';

class Fixture
{
  String? day;
  List<FutureMatchday>? match;
  Fixture
  ({
    this.day,
    this.match
  });

  Fixture.fromJson(String key , List<dynamic> values)
  {
    day=key;
    match = <FutureMatchday>[];
    values.forEach((v) 
    {
      match!.add(FutureMatchday.fromJson(v));
    });
  }

}