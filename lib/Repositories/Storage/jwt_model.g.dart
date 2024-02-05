// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JWTModelAdapter extends TypeAdapter<JWTModel> {
  @override
  final int typeId = 0;

  @override
  JWTModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JWTModel(
      jwt: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, JWTModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.jwt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JWTModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
