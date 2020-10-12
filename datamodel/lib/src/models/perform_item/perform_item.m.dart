import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'perform_item.m.flamingo.dart';
part 'perform_item.m.g.dart';

@CopyWith()
class PerformItem extends Model {
  @Field()
  String exerciseId;
  @Field()
  int order;
  @Field()
  int duration;
  @Field()
  int side;
  @Field()
  double weight;
  @Field()
  int progress;

  PerformItem({
    this.exerciseId,
    this.order,
    this.duration,
    this.side = 0,
    this.weight = 0,
    this.progress = 0,
    Map<String, dynamic> values,
  });

  @override
  Map<String, dynamic> toData() => _$toData(this);
  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
