import 'package:ball_dont_lie/models/matchday.dart';

class Results 
{
  String? day;
  List<Matchday>? match;
  Results
  ({
    this.day,
    this.match, 
  });

  Results.fromJson(String key , List<dynamic> values ) 
  {
    day=key;
    if (values != null) 
    {
      match = <Matchday>[];
      values.forEach((v) 
      {
        match!.add(Matchday.fromJson(v));
      });
    }
    
  }

  // Map<String, dynamic> toJson() 
  // {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   if (match != null) 
  //   {
  //     data[' Matchday 21 '] = match!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}