class AddNewAddressModel {
  final bool status;
  final String message;
  final AddNewAddressData data;

  AddNewAddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddNewAddressModel.fromJson(Map<String, dynamic> json) {
    return AddNewAddressModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: AddNewAddressData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class AddNewAddressData {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;
  final int id;

  AddNewAddressData({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.id,
  });

  factory AddNewAddressData.fromJson(Map<String, dynamic> json) {
    return AddNewAddressData(
      name: json['name'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      details: json['details'] as String,
      notes: json['notes'] as String,
      id: json['id'] as int,
    );
  }
}
