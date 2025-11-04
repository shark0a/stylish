import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Dimensions {
  @HiveField(0)
  final double width;
  @HiveField(1)
  final double height;
  @HiveField(2)
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> map) {
    return Dimensions(
      width: (map['width'] as num).toDouble(),
      height: (map['height'] as num).toDouble(),
      depth: (map['depth'] as num).toDouble(),
    );
  }
}
