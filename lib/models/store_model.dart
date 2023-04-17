// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class StoreModel {
  int id;
  String nameStore;
  List<String> images;
  bool isPopular;

  StoreModel(
      {required this.id,
      required this.nameStore,
      required this.images,
      this.isPopular = false});

  StoreModel copyWith({
    int? id,
    String? nameStore,
    List<String>? images,
  }) {
    return StoreModel(
      id: id ?? this.id,
      nameStore: nameStore ?? this.nameStore,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameStore': nameStore,
      'images': images,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
        id: map['id'] as int,
        nameStore: map['nameStore'] as String,
        images: List<String>.from(
          (map['images'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory StoreModel.fromJson(String source) =>
      StoreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StoreModel(id: $id, nameStore: $nameStore, images: $images)';

  @override
  bool operator ==(covariant StoreModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nameStore == nameStore &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode => id.hashCode ^ nameStore.hashCode ^ images.hashCode;
}

final List<StoreModel> stores = [
  StoreModel(
      id: 1,
      nameStore: 'FHH-GLOBAL 01',
      images: [
        "https://fastly.picsum.photos/id/28/4928/3264.jpg?hmac=GnYF-RnBUg44PFfU5pcw_Qs0ReOyStdnZ8MtQWJqTfA",
        "https://fastly.picsum.photos/id/42/3456/2304.jpg?hmac=dhQvd1Qp19zg26MEwYMnfz34eLnGv8meGk_lFNAJR3g",
        "https://fastly.picsum.photos/id/111/4400/2656.jpg?hmac=leq8lj40D6cqFq5M_NLXkMYtV-30TtOOnzklhjPaAAQ"
      ],
      isPopular: true),
  StoreModel(
      id: 2,
      nameStore: 'FHH-GLOBAL 02',
      images: [
        "https://fastly.picsum.photos/id/110/5000/3333.jpg?hmac=AvUBrnXG4ebvrtC08T95vEzD1I9SryZ8KSQ4iJ9tb9s",
        "https://fastly.picsum.photos/id/116/3504/2336.jpg?hmac=C46vgpj3R407e8pCyy8NhIsNaBZCjb4r5d71keNgMJY",
        "https://fastly.picsum.photos/id/127/4032/2272.jpg?hmac=QFoFT2_eb_DCqjdlj09UFgUHwI_zefDTBdECRz9lO5Q"
      ],
      isPopular: true),
  StoreModel(
      id: 3,
      nameStore: 'FHH-GLOBAL 03',
      images: [
        "https://fastly.picsum.photos/id/133/2742/1828.jpg?hmac=0X5o8bHUICkOIvZHtykCRL50Bjn1N8w1AvkenF7n93E",
        "https://fastly.picsum.photos/id/152/3888/2592.jpg?hmac=M1xv1MzO9xjf5-tz1hGR9bQpNt973ANkqfEVDW0-WYU"
      ],
      isPopular: true),
  StoreModel(id: 4, nameStore: 'FHH-GLOBAL 04', images: [
    "https://fastly.picsum.photos/id/163/2000/1333.jpg?hmac=htdHeSJwlYOxS8b0TTpz2s8tD_QDlmsd3JHYa_HGrg8"
  ]),
  StoreModel(
      id: 5,
      nameStore: 'FHH-GLOBAL 05',
      images: [
        "https://fastly.picsum.photos/id/169/2500/1662.jpg?hmac=3DBeyQbiPxO88hBdhIuFPbvy2ff7cm9vmnq8lPIL9Ug"
      ],
      isPopular: true)
];
