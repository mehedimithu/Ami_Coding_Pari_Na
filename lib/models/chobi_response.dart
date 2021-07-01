
import 'dart:convert';

List<Chobi> chobiFromJson(String str) => List<Chobi>.from(json.decode(str).map((x) => Chobi.fromJson(x)));

String chobiToJson(List<Chobi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chobi {
  Chobi({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory Chobi.fromJson(Map<String, dynamic> json) => Chobi(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
