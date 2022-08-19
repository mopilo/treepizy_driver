
class VehicleMakeModel {
  String? context;
  String? id;
  String? type;
  List<Hydramember>? hydramember;
  int? hydratotalItems;

  VehicleMakeModel({this.context, this.id, this.type, this.hydramember, this.hydratotalItems});

  VehicleMakeModel.fromJson(Map<String, dynamic> json) {
    if(json["@context"] is String) {
      context = json["@context"];
    }
    if(json["@id"] is String) {
      id = json["@id"];
    }
    if(json["@type"] is String) {
      type = json["@type"];
    }
    if(json["hydra:member"] is List) {
      hydramember = json["hydra:member"]==null ? null : (json["hydra:member"] as List).map((e)=>Hydramember.fromJson(e)).toList();
    }
    if(json["hydra:totalItems"] is int) {
      hydratotalItems = json["hydra:totalItems"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@context"] = context;
    data["@id"] = id;
    data["@type"] = type;
    if(hydramember != null) {
      data["hydra:member"] = hydramember!.map((e)=>e.toJson()).toList();
    }
    data["hydra:totalItems"] = hydratotalItems;
    return data;
  }
}

class Hydramember {
  String? id;
  String? type;
  String? name;
  List<String>? models;

  Hydramember({this.id, this.type, this.name, this.models});

  Hydramember.fromJson(Map<String, dynamic> json) {
    if(json["@id"] is String) {
      id = json["@id"];
    }
    if(json["@type"] is String) {
      type = json["@type"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["models"] is List) {
      models = json["models"]==null ? null : List<String>.from(json["models"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@id"] = id;
    data["@type"] = type;
    data["name"] = name;
    if(models != null) {
      data["models"] = models;
    }
    return data;
  }
}