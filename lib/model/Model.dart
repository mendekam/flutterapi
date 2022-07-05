import 'dart:convert';

Phone phoneFromJson(String str) => Phone.fromJson(json.decode(str));

String phoneToJson(Phone data) => json.encode(data.toJson());

class Phone {
  Phone({
    required this.brand_id,
    required this.brand_name,
    required this.brand_slug,
    required this.device_count,
    required this.detail,
  });

  int brand_id;
  String brand_name;
  String brand_slug;
  int device_count;
  String detail;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    brand_id: json["id"],
    brand_name: json["brand_name"],
    brand_slug: json["brand_slug"],
    device_count: json["device_count"],
    detail: json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "brand_id": brand_id,
    "brand_name": brand_name,
    "brand_slug": brand_slug,
    "device_count": device_count,
    "detail": detail,
  };
}