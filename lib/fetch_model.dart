// To parse this JSON data, do
//
//     final modelClass = modelClassFromJson(jsonString);

import 'dart:convert';

ModelClassFetch modelClassFromMap(String str) => ModelClassFetch.fromJson(json.decode(str));

String modelClassToMap(ModelClassFetch data) => json.encode(data.toJson());

class ModelClassFetch {
  ModelClassFetch({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;
  Support support;

  factory ModelClassFetch.fromJson(Map<String, dynamic> json) => ModelClassFetch(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    support: Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "support": support.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}





























//
//
// import 'dart:convert';
//
// ModelClass modelClassFromMap(String str) => ModelClass.fromJson(json.decode(str));
//
// String modelClassToMap(ModelClass data) => json.encode(data.toJson());
//
// class ModelClass {
//   ModelClass({
//     required this.page,
//     required this.perPage,
//     required this.total,
//     required this.totalPages,
//     required this.data,
//     required this.support,
//   });
//
//   int page;
//   int perPage;
//   int total;
//   int totalPages;
//   List<Datum> data;
//   Support support;
//
//   factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
//     page: json["page"],
//     perPage: json["per_page"],
//     total: json["total"],
//     totalPages: json["total_pages"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     support: Support.fromJson(json["support"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "page": page,
//     "per_page": perPage,
//     "total": total,
//     "total_pages": totalPages,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "support": support.toJson(),
//   };
// }
//
// class Datum {
//   Datum({
//     required this.id,
//     required this.name,
//     required this.year,
//     required this.color,
//     required this.pantoneValue,
//   });
//
//   int id;
//   String name;
//   int year;
//   String color;
//   String pantoneValue;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     name: json["name"],
//     year: json["year"],
//     color: json["color"],
//     pantoneValue: json["pantone_value"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "year": year,
//     "color": color,
//     "pantone_value": pantoneValue,
//   };
// }
//
// class Support {
//   Support({
//     required this.url,
//     required this.text,
//   });
//
//   String url;
//   String text;
//
//   factory Support.fromJson(Map<String, dynamic> json) => Support(
//     url: json["url"],
//     text: json["text"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "url": url,
//     "text": text,
//   };
// }
