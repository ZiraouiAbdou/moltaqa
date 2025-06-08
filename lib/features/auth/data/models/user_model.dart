class UserModel {
  String? uid;
  String? username;
  String? email;
  String? playingSince;
  Stats? stats;
  List<String>? createdPacks;
  List<String>? bookmarkedPacks;

  UserModel({
    this.uid,
    this.username,
    this.email,
    this.playingSince,
    this.stats,
    this.createdPacks,
    this.bookmarkedPacks,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    username: json['username'],
    email: json['email'],
    playingSince: json['playingSince'],
    stats: json['stats'] != null ? Stats.fromJson(json['stats']) : null,
    createdPacks: json['createdPacks'].cast<String>(),
    bookmarkedPacks: json['bookmarkedPacks'].cast<String>(),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = uid;
    data['username'] = username;
    data['email'] = email;
    data['playingSince'] = playingSince;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    data['createdPacks'] = createdPacks ?? [];
    data['bookmarkedPacks'] = bookmarkedPacks ?? [];
    return data;
  }
}

class Stats {
  int? totalPlays;
  int? firstPlace;
  int? secondPlace;
  int? thirdPlace;

  Stats({this.totalPlays, this.firstPlace, this.secondPlace, this.thirdPlace});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    totalPlays: json['totalPlays'],
    firstPlace: json['firstPlace'],
    secondPlace: json['secondPlace'],
    thirdPlace: json['thirdPlace'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPlays'] = totalPlays ?? 0;
    data['firstPlace'] = firstPlace ?? 0;
    data['secondPlace'] = secondPlace ?? 0;
    data['thirdPlace'] = thirdPlace ?? 0;
    return data;
  }
}
