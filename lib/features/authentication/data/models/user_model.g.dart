// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  emailVerifiedAt: json['email_verified_at'] as String?,
  avatar: json['avatar'] as String?,
  provider: json['provider'] as String?,
  providerId: json['provider_id'] as String?,
  cityId: (json['city_id'] as num?)?.toInt(),
  clanId: (json['clan_id'] as num?)?.toInt(),
  roles: (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'email_verified_at': instance.emailVerifiedAt,
  'avatar': instance.avatar,
  'provider': instance.provider,
  'provider_id': instance.providerId,
  'city_id': instance.cityId,
  'clan_id': instance.clanId,
  'roles': instance.roles,
};

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['emailVerifiedAt'] as String?,
      avatar: json['avatar'] as String?,
      provider: json['provider'] as String?,
      providerId: json['providerId'] as String?,
      cityId: (json['cityId'] as num?)?.toInt(),
      clanId: (json['clanId'] as num?)?.toInt(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'avatar': instance.avatar,
      'provider': instance.provider,
      'providerId': instance.providerId,
      'cityId': instance.cityId,
      'clanId': instance.clanId,
      'roles': instance.roles,
    };
