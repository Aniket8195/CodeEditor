import 'package:hive/hive.dart';

part 'jwt_model.g.dart';


@HiveType(typeId: 0)
class JWTModel extends HiveObject{
  @HiveField(0)
  final String? jwt;

  JWTModel({this.jwt});
}