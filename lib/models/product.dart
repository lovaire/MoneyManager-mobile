// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    DateTime dateAdded;
    String name;
    int amount;
    String description;
    int user;

    Fields({
        required this.dateAdded,
        required this.name,
        required this.amount,
        required this.description,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        dateAdded: DateTime.parse(json["date_added"]),
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "name": name,
        "amount": amount,
        "description": description,
        "user": user,
    };
}
