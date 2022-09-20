import 'package:json_annotation/json_annotation.dart';

import 'aaaModel.dart';
part 'listModel.g.dart';

@JsonSerializable()
class ListModel {
  List<AaaModel>? groups_list;

  ListModel({this.groups_list});
  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}

//flutter pub run build_runner build