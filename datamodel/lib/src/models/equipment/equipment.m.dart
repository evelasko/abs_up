import 'package:equatable/equatable.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'equipment.m.flamingo.dart';

class Equipment extends Document<Equipment> {
  @Field()
  String id;
  @Field()
  String label;
  @Field()
  String description;
  @Field()
  String owner;

  // IconData get icon => IconData(
  //       iconCodePoint,
  //       fontFamily: iconFontFamily,
  //       fontPackage: iconFontPackage,
  //     );

  Equipment({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);
  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
