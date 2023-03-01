import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User
{
  late String uid;
  late String name;  
  late List<String> selectedLeags;

  User({required this.uid,required this.name,required this.selectedLeags});  


  factory User.fromJson(Map<String,dynamic>map)=>_$UserFromJson(map);

  Map<String,dynamic> toJson()=> _$UserToJson(this);

}