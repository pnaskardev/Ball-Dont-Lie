import 'package:ball_dont_lie/models/matchday.dart';

class Results 
{
  List<Matchday>? Matchday21;
  List<Matchday>? Matchday20;
  List<Matchday>? Matchday19;
  List<Matchday>? Matchday18;

  Results
  ({
    this.Matchday21, 
    this.Matchday20, 
    this.Matchday19, 
    this.Matchday18
  });

  Results.fromJson(Map<String, dynamic> json) 
  {
    if (json[' Matchday 21 '] != null) 
    {
      Matchday21 = <Matchday>[];
      json[' Matchday 21 '].forEach((v) 
      {
        Matchday21!.add(Matchday.fromJson(v));
      });
    }
    if (json[' Matchday 20 '] != null) 
    {
      Matchday20 = <Matchday>[];
      json[' Matchday 20 '].forEach((v) 
      {
        Matchday20!.add(Matchday.fromJson(v));
      });
    }
    if (json[' Matchday 19 '] != null) 
    {
      Matchday19 = <Matchday>[];
      json[' Matchday 19 '].forEach((v) 
      {
        Matchday19!.add(Matchday.fromJson(v));
      });
    }
    if (json[' Matchday 18 '] != null) 
    {
      Matchday18 = <Matchday>[];
      json[' Matchday 18 '].forEach((v) 
      {
        Matchday18!.add(Matchday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (Matchday21 != null) 
    {
      data[' Matchday 21 '] = Matchday21!.map((v) => v.toJson()).toList();
    }
    if (Matchday20 != null) 
    {
      data[' Matchday 20 '] = Matchday20!.map((v) => v.toJson()).toList();
    }
    if (Matchday19 != null) 
    {
      data[' Matchday 19 '] = Matchday19!.map((v) => v.toJson()).toList();
    }
    if (Matchday18 != null) 
    {
      data[' Matchday 18 '] = Matchday18!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}