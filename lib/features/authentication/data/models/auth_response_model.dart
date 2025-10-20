import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required bool success,
    required String message,
    required AuthDataModel data,
  }) = _AuthResponseModel;
  
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class AuthDataModel with _$AuthDataModel {
  const factory AuthDataModel({
    required UserModel user,
    required String token,
  }) = _AuthDataModel;
  
  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);
}