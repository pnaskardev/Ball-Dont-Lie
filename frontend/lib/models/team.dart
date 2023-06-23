// ignore_for_file: unnecessary_this

class Team {
  String? teamPosition;
  String? teamLogo;
  String? teamName;
  String? gp;
  String? w;
  String? d;
  String? l;
  String? f;
  String? a;
  String? gd;
  String? p;
  String? sId;

  Team(
      {this.teamPosition,
      this.teamLogo,
      this.teamName,
      this.gp,
      this.w,
      this.d,
      this.l,
      this.f,
      this.a,
      this.gd,
      this.p,
      this.sId});

  Team.fromJson(Map<String, dynamic> json) {
    teamPosition = json['teamPosition'];
    teamLogo = json['teamLogo'];
    teamName = json['teamName'];
    gp = json['gp'];
    w = json['w'];
    d = json['d'];
    l = json['l'];
    f = json['f'];
    a = json['a'];
    gd = json['gd'];
    p = json['p'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teamPosition'] = this.teamPosition;
    data['teamLogo'] = this.teamLogo;
    data['teamName'] = this.teamName;
    data['gp'] = this.gp;
    data['w'] = this.w;
    data['d'] = this.d;
    data['l'] = this.l;
    data['f'] = this.f;
    data['a'] = this.a;
    data['gd'] = this.gd;
    data['p'] = this.p;
    data['_id'] = this.sId;
    return data;
  }
}