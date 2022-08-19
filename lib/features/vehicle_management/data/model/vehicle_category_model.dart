
class VehicleCategoryModel {
  String? context;
  String? id;
  String? type;
  List<HydraMember>? hydraMember;
  int? hydraTotalItems;

  VehicleCategoryModel({this.context, this.id, this.type, this.hydraMember, this.hydraTotalItems});

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
      hydraMember = json["hydra:member"]==null ? null : (json["hydra:member"] as List).map((e)=>HydraMember.fromJson(e)).toList();
    }
    if(json["hydra:totalItems"] is int) {
      hydraTotalItems = json["hydra:totalItems"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@context"] = context;
    data["@id"] = id;
    data["@type"] = type;
    if(hydraMember != null) {
      data["hydra:member"] = hydraMember!.map((e)=>e.toJson()).toList();
    }
    data["hydra:totalItems"] = hydraTotalItems;
    return data;
  }
}

class HydraMember  {
  String? id;
  String? type;
  String? name;
  dynamic refId;

  HydraMember({this.id, this.type, this.name, this.refId});

  HydraMember.fromJson(Map<String, dynamic> json) {
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