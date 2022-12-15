import 'dart:convert';

Topochka topochkaFromJson(String str) => Topochka.fromJson(json.decode(str));

String topochkaToJson(List<Topochka> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topochka {
  Topochka({
    required this.id,
    required this.ranking,
    required this.name,
    required this.logo,
    required this.players,
  });

  int id;
  int ranking;
  String name;
  String logo;
  List<Player> players;

  factory Topochka.fromJson(Map<String, dynamic> json) => Topochka(
    id: json["id"],
    ranking: json["ranking"],
    name: json["name"],
    logo: json["logo"],
    players: List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ranking": ranking,
    "name": name,
    "logo": logo,
    "players": List<dynamic>.from(players.map((x) => x.toJson())),
  };
}

class Player {
  Player({
    required this.fullname,
    required this.image,
    required this.nickname,
    required this.country,
  });

  String fullname;
  String image;
  String nickname;
  Country country;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    fullname: json["fullname"],
    image: json["image"],
    nickname: json["nickname"],
    country: Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "image": image,
    "nickname": nickname,
    "country": country.toJson(),
  };
}

class Country {
  Country({
    required this.name,
    required this.flag,
  });

  String name;
  String flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "flag": flag,
  };
}
