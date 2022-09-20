import 'package:json_annotation/json_annotation.dart';
part 'aaaModel.g.dart';

@JsonSerializable()
class AaaModel {
  String name;

  AaaModel(this.name);
  factory AaaModel.fromJson(Map<String, dynamic> json) =>
      _$AaaModelFromJson(json);
  Map<String, dynamic> toJson() => _$AaaModelToJson(this);
}

//flutter pub run build_runner build