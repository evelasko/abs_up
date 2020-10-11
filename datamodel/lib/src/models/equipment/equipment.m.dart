import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment.m.g.dart';

@immutable
@CopyWith()
@JsonSerializable(nullable: false)
class Equipment extends Equatable {
  final String id;
  final String label;
  final String description;
  final String owner;

  // IconData get icon => IconData(
  //       iconCodePoint,
  //       fontFamily: iconFontFamily,
  //       fontPackage: iconFontPackage,
  //     );

  const Equipment({
    @required this.id,
    @required this.description,
    @required this.label,
    @required this.owner,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);

  @override
  List<Object> get props => [
        id,
        label,
        description,
        owner,
      ];

  @override
  bool get stringify => true;
}
