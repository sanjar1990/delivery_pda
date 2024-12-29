class SearchModel {
  final int? id;
  final String? customerName;
  final String? trackNumber;
  final int? userId;
  final int? branchId;
  final String? locationNumber;
  final bool? delivered;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? paymentFee;
  final int? weight;

  SearchModel({
    this.id,
    this.customerName,
    this.trackNumber,
    this.userId,
    this.branchId,
    this.locationNumber,
    this.delivered,
    this.createdAt,
    this.updatedAt,
    this.paymentFee,
    this.weight,
  });

  // JSON'dan obyektga o'girish
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'] as int?,
      customerName: json['customer_name'] as String?,
      trackNumber: json['trackNumber'] as String?,
      userId: json['user_id'] as int?,
      branchId: json['branch_id'] as int?,
      locationNumber: json['location_number'] as String?,
      delivered: json['delivered'] as bool?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      paymentFee: json['payment_fee'] as int?,
      weight: json['weight'] as int?,
    );
  }

  // Obyektdan JSON'ga o'girish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_name': customerName,
      'trackNumber': trackNumber,
      'user_id': userId,
      'branch_id': branchId,
      'location_number': locationNumber,
      'delivered': delivered,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'payment_fee': paymentFee,
      'weight': weight,
    };
  }
}
