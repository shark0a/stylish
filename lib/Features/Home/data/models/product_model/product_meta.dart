import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class Meta {
  @HiveField(0)
  final String createdAt;
  @HiveField(1)
  final String updatedAt;
  @HiveField(2)
  final String barcode;
  @HiveField(3)
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> map) {
    return Meta(
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      barcode: map['barcode'],
      qrCode: map['qrCode'],
    );
  }
}
