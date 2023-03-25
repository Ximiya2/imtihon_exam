// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardsModelAdapter extends TypeAdapter<CardsModel> {
  @override
  final int typeId = 1;

  @override
  CardsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardsModel(
      cost: fields[1] as String,
      name: fields[2] as String,
      date: fields[3] as String,
      number: fields[4] as String,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.cost)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.number)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
