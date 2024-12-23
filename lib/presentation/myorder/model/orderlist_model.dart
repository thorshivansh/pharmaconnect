class OrderListItemModel {
  String? orderId;
  String? orderDate;
  String? deliveredOn;
  String? items;
  String? orderImage;
  int? status;

  OrderListItemModel(
      {this.orderId,
      this.orderDate,
      this.deliveredOn,
      this.items,
      this.orderImage,
      this.status});

  factory OrderListItemModel.fromJson(Map<String, dynamic> json) {
    return OrderListItemModel(
      orderId: json['orderId'],
      orderDate: json['orderDate'],
      deliveredOn: json['deliveredOn'],
      items: json['items'],
      orderImage: json['orderImage'],
    );
  }
}
