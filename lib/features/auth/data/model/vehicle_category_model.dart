
class VehicleCategoryModel {
  String? context;
  String? id;
  String? type;
  List<Hydramember>? hydramember;
  int? hydratotalItems;

  VehicleCategoryModel({this.context, this.id, this.type, this.hydramember, this.hydratotalItems});

  VehicleCategoryModel.fromJson(Map<String, dynamic> json) {
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

class Hydramember  {
  String? id;
  String? type;
  String? name;
  dynamic refId;

  Hydramember({this.id, this.type, this.name, this.refId});

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
    refId = json["refId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@id"] = id;
    data["@type"] = type;
    data["name"] = name;
    data["refId"] = refId;
    return data;
  }
}