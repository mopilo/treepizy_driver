class AddVehicleSuccessModal {
  String? context;
  String? id;
  String? type;
  String? year;
  String? color;
  String? plateNo;
  Owner? owner;
  VehicleModel? vehicleModel;
  List<dynamic>? associatedServices;
  dynamic? driver;
  String? status;
  String? activationStatus;
  String? approval;
  String? engineNo;
  VehicleCategory? vehicleCategory;
  String? inspectionCode;
  dynamic? vehicleCertificate;
  dynamic? vehicleInsurance;
  dynamic? vehicleRoadworthiness;
  dynamic? rejectionReason;
  List<dynamic>? tags;
  String? refId;

  AddVehicleSuccessModal(
      {context,
      id,
      type,
      year,
      color,
      plateNo,
      owner,
      vehicleModel,
      associatedServices,
      driver,
      status,
      activationStatus,
      approval,
      engineNo,
      vehicleCategory,
      inspectionCode,
      vehicleCertificate,
      vehicleInsurance,
      vehicleRoadworthiness,
      rejectionReason,
      tags,
      refId});

  AddVehicleSuccessModal.fromJson(Map<String, dynamic> json) {
    context = json["@context"];
    id = json["@id"];
    type = json["@type"];
    year = json["year"];
    color = json["color"];
    plateNo = json["plateNo"];
    owner = json["owner"] == null ? null : Owner.fromJson(json["owner"]);
    vehicleModel = json["vehicleModel"] == null
        ? null
        : VehicleModel.fromJson(json["vehicleModel"]);
    associatedServices = json["associatedServices"] ?? [];
    driver = json["driver"];
    status = json["status"];
    activationStatus = json["activationStatus"];
    approval = json["approval"];
    engineNo = json["engineNo"];
    vehicleCategory = json["vehicleCategory"] == null
        ? null
        : VehicleCategory.fromJson(json["vehicleCategory"]);
    inspectionCode = json["inspectionCode"];
    vehicleCertificate = json["vehicleCertificate"];
    vehicleInsurance = json["vehicleInsurance"];
    vehicleRoadworthiness = json["vehicleRoadworthiness"];
    rejectionReason = json["rejectionReason"];
    tags = json["tags"] ?? [];
    refId = json["refId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@context"] = context;
    data["@id"] = id;
    data["@type"] = type;
    data["year"] = year;
    data["color"] = color;
    data["plateNo"] = plateNo;
    if (owner != null) {
      data["owner"] = owner?.toJson();
    }
    if (vehicleModel != null) {
      data["vehicleModel"] = vehicleModel?.toJson();
    }
    if (associatedServices != null) {
      data["associatedServices"] = associatedServices;
    }
    data["driver"] = driver;
    data["status"] = status;
    data["activationStatus"] = activationStatus;
    data["approval"] = approval;
    data["engineNo"] = engineNo;
    if (vehicleCategory != null) {
      data["vehicleCategory"] = vehicleCategory?.toJson();
    }
    data["inspectionCode"] = inspectionCode;
    data["vehicleCertificate"] = vehicleCertificate;
    data["vehicleInsurance"] = vehicleInsurance;
    data["vehicleRoadworthiness"] = vehicleRoadworthiness;
    data["rejectionReason"] = rejectionReason;
    if (tags != null) {
      data["tags"] = tags;
    }
    data["refId"] = refId;
    return data;
  }
}

class VehicleCategory {
  String? id;
  String? type;
  dynamic? refId;

  VehicleCategory({id, type, refId});

  VehicleCategory.fromJson(Map<String, dynamic> json) {
    id = json["@id"];
    type = json["@type"];
    refId = json["refId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@id"] = id;
    data["@type"] = type;
    data["refId"] = refId;
    return data;
  }
}

class VehicleModel {
  String? id;
  String? type;
  dynamic? refId;

  VehicleModel({id, type, refId});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    id = json["@id"];
    type = json["@type"];
    refId = json["refId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@id"] = id;
    data["@type"] = type;
    data["refId"] = refId;
    return data;
  }
}

class Owner {
  String? id;
  String? type;
  String? refId;

  Owner({id, type, refId});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json["@id"];
    type = json["@type"];
    refId = json["refId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["@id"] = id;
    data["@type"] = type;
    data["refId"] = refId;
    return data;
  }
}
