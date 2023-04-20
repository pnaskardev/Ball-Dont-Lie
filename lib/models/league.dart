class League {
  String name;
  String code;
  
  League({
    required this.name,
    required this.code,
  });
  
  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      name: json['name'],
      code: json['code'],
    );
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
