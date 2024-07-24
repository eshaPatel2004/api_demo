
class UserDataModel {
  String? n1;
  String? t;
  String? n2;
  String? e;
  String? m;

  UserDataModel({
    this.n1,
    this.t,
    this.n2,
    this.e,
    this.m,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>  UserDataModel(
    n1: json["n1"],
    t: json["t"],
    n2: json["n2"],
    e: json["e"],
    m: json["m"],
  );

  Map<String, dynamic> toJson() => {
    "n1": n1,
    "t": t,
    "n2": n2,
    "e": e,
    "m": m,
  };
}
