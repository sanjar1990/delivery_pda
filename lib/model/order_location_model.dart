class DataModel {
  final int id;
  final String number;
  final int branchId;
  final String createdAt;
  final String updatedAt;

  DataModel({
    required this.id,
    required this.branchId,
    required this.number,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor for creating an instance from JSON
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      number: json['number'],
      branchId: json['branch_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'branch_id': branchId
    };
  }
}

// Wrapper class for the list of DataModel
class DataList {
  final List<DataModel> data;

  DataList({required this.data});

  // Factory constructor for creating an instance from JSON
  factory DataList.fromJson(Map<String, dynamic> json) {
    return DataList(
      data: List<DataModel>.from(
        json['data'].map((item) => DataModel.fromJson(item)),
      ),
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
