class ScannerModel {
  ScannerModel({
    this.id,
    this.valor,
  });

  int? id;
  String? valor;

  factory ScannerModel.fromJson(Map<String, dynamic> json) => ScannerModel(
        id: json["id"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
      };
}
