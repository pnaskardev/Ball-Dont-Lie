// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      name: json['name'] as String,
      selectedLeags: (json['selectedLeags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      favLeague: json['favLeague'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'favLeague': instance.favLeague,
      'selectedLeags': instance.selectedLeags,
    };
