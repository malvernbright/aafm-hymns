// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteHymnsAdapter extends TypeAdapter<FavouriteHymns> {
  @override
  final int typeId = 0;

  @override
  FavouriteHymns read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteHymns(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteHymns obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.hymn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteHymnsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
