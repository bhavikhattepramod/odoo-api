import 'package:json_annotation/json_annotation.dart';
part 'mod.g.dart';

@JsonSerializable()
class Mod {
  String name;
  String email;
  String password;
  Mod(this.name, this.email, this.password);
  factory Mod.fromJson(Map<String, dynamic> json) => _$ModFromJson(json);
  Map<String, dynamic> toJson() => _$ModToJson(this);
}

//flutter pub run build_runner build
