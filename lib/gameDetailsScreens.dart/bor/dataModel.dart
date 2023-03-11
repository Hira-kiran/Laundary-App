// // ignore_for_file: file_names, avoid_types_as_parameter_names

// import 'package:json_annotation/json_annotation.dart';

// import 'model.dart';
// // part 'dataModel.g.dart';

// @JsonSerializable()
// class ListDataModel {
//   List<Model>? data;

//   ListDataModel({this.data});
//   /* factory ListDataModel.fromJson(Map<String, dynamic> json) =>
//       _$ListDataModelFromJson(json);
//   Map<String, dynamic> toJson() => _$ListDataModelToJson(this); */
// }

// ignore_for_file: prefer_collection_literals, unnecessary_this, file_names

class ListModel {
  String? number;
  String? amount;
  ListModel({this.number, this.amount});
  ListModel.fromJson(Map<String, dynamic> json) {
    number = json["num"];
    amount = json["amount"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["num"] = this.number;
    data["amount"] = this.amount;
    return data;
  }
}
