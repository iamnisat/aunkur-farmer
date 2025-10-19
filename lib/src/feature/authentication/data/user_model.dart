class UserSignUpRequest {
  final int id;
  final String name;
  final String phone;
  final String nid;
  final String division;
  final String district;
  final String upazila;
  final String union;
  final String token;
  final String password;
  final String village;

  UserSignUpRequest({
    required this.id,
    required this.name,
    required this.phone,
    required this.nid,
    required this.division,
    required this.district,
    required this.upazila,
    required this.union,
    this.token = "",
    this.password = "",
    this.village = "",
  });

  factory UserSignUpRequest.fromJson(Map<String, dynamic> json) {
    return UserSignUpRequest(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      nid: json['nid'] ?? '',
      division: json['division'] ?? '',
      district: json['district'] ?? '',
      upazila: json['upazila'] ?? '',
      union: json['union'] ?? '',
      token: json['token'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "mobile": phone,
      "division": int.tryParse(division) ?? 0,
      "district": int.tryParse(district) ?? 0,
      "is_self": true,
      "nid": nid,
      "password": password,
      "village": village,
      "upazilla": int.tryParse(upazila) ?? 0,
      "union": int.tryParse(union) ?? 0,
    };
  }
}

class UserModel {
  final String name;
  final String divisionName;
  final String districtName;
  final String upazillaName;
  final String unionName;
  final bool status;
  final bool subscribe;
  final int id;
  final String village;
  final dynamic postOffice;
  final dynamic image;
  final dynamic gender;
  final bool isAssociated;
  final dynamic spouseOrFather;
  final dynamic motherName;
  final String mobile;
  final String nid;
  final dynamic maleMembers;
  final dynamic femaleMembers;
  final dynamic totalMembers;
  final dynamic schoolGoing;
  final dynamic family;
  final dynamic timeInfo;
  final dynamic nidImage;
  final dynamic nidImageBack;
  final dynamic experience;
  final bool initialUserSignUpRequest;
  final int createdAt;
  final dynamic baseImage;
  final dynamic education;
  final dynamic rfid;
  final dynamic serviceCenterId;

  UserModel({
    this.name = "",
    this.divisionName = "",
    this.districtName = "",
    this.upazillaName = "",
    this.unionName = "",
    this.status = false,
    this.subscribe = false,
    this.id = 0,
    this.village = "",
    this.postOffice,
    this.image,
    this.gender,
    this.isAssociated = false,
    this.spouseOrFather,
    this.motherName,
    this.mobile = "",
    this.nid = "",
    this.maleMembers,
    this.femaleMembers,
    this.totalMembers,
    this.schoolGoing,
    this.family,
    this.timeInfo,
    this.nidImage,
    this.nidImageBack,
    this.experience,
    this.initialUserSignUpRequest = false,
    this.createdAt = 0,
    this.baseImage,
    this.education,
    this.rfid,
    this.serviceCenterId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"] ?? "",
    divisionName: json["division_name"] ?? "",
    districtName: json["district_name"] ?? "",
    upazillaName: json["upazilla_name"] ?? "",
    unionName: json["union_name"] ?? "",
    status: json["status"] ?? false,
    subscribe: json["subscribe"] ?? false,
    id: json["id"] ?? 0,
    village: json["village"] ?? "",
    postOffice: json["post_office"],
    image: json["image"],
    gender: json["gender"],
    isAssociated: json["is_associated"] ?? false,
    spouseOrFather: json["spouse_or_father"],
    motherName: json["mother_name"],
    mobile: json["mobile"] ?? "",
    nid: json["nid"] ?? "",
    maleMembers: json["male_members"],
    femaleMembers: json["female_members"],
    totalMembers: json["total_members"],
    schoolGoing: json["school_going"],
    family: json["family"],
    timeInfo: json["time_info"],
    nidImage: json["nid_image"],
    nidImageBack: json["nid_image_back"],
    experience: json["experience"],
    initialUserSignUpRequest: json["initial_UserSignUpRequest"] ?? false,
    createdAt: json["createdAt"] ?? 0,
    baseImage: json["base_image"],
    education: json["education"],
    rfid: json["rfid"],
    serviceCenterId: json["service_center_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "division_name": divisionName,
    "district_name": districtName,
    "upazilla_name": upazillaName,
    "union_name": unionName,
    "status": status,
    "subscribe": subscribe,
    "id": id,
    "village": village,
    "post_office": postOffice,
    "image": image,
    "gender": gender,
    "is_associated": isAssociated,
    "spouse_or_father": spouseOrFather,
    "mother_name": motherName,
    "mobile": mobile,
    "nid": nid,
    "male_members": maleMembers,
    "female_members": femaleMembers,
    "total_members": totalMembers,
    "school_going": schoolGoing,
    "family": family,
    "time_info": timeInfo,
    "nid_image": nidImage,
    "nid_image_back": nidImageBack,
    "experience": experience,
    "initial_UserSignUpRequest": initialUserSignUpRequest,
    "createdAt": createdAt,
    "base_image": baseImage,
    "education": education,
    "rfid": rfid,
    "service_center_id": serviceCenterId,
  };
}
