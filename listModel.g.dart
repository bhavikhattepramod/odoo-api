// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModel _$ListModelFromJson(Map<String, dynamic> json) => ListModel(
      groups_list: (json['groups_list'] as List<dynamic>?)
          ?.map((e) => AaaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListModelToJson(ListModel instance) => <String, dynamic>{
      'groups_list': instance.groups_list,
    };
