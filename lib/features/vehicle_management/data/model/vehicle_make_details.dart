class VehicleMakeDetails {
  String? context;
  String? id;
  String? type;
  String? name;
  List<Models>? models;

  VehicleMakeDetails(
      {this.context, this.id, this.type, this.name, this.models});

  VehicleMakeDetails.fromJson(Map<String, dynamic> json) {
    context = json["@context"];
    id = json["@id"];
    type = json["@type"];
    name = json["name"];
    models = json["models"] == null
        ? null
        : (json["models"] as List).map((e) => Models.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@context"] = context;
    data["@id"] = id;
    data["@type"] = type;
    data["name"] = name;
    if (models != null) {
      data["models"] = models?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Models {
  String? id;
  String? type;
  String? name;

  Models({this.id, this.type, this.name});

  Models.fromJson(Map<String, dynamic> json) {
    id = json["@id"];
    type = json["@type"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@id"] = id;
    data["@type"] = type;
    data["name"] = name;
    return data;
  }
}
