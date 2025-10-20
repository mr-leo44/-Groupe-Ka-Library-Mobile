import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    String? emailVerifiedAt,
    String? avatar,
    String? provider,
    String? providerId,
    int? cityId,
    int? clanId,
    List<String>? roles,
  }) = _UserModel;
  
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}