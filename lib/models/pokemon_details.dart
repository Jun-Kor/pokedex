import 'package:equatable/equatable.dart';

class PokemonDetails extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final String description;

  const PokemonDetails({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.height,
    required this.weight,
    required this.description,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageUrl,
      types,
      height,
      weight,
      description,
    ];
  }

  @override
  String toString() {
    return 'PokemonDetails(id: $id, name: $name, imageUrl: $imageUrl, types: $types, height: $height, weight: $weight, description: $description,)';
  }

  PokemonDetails copyWith({
    int? id,
    String? name,
    String? imageUrl,
    List<String>? types,
    int? height,
    int? weight,
    String? description,
  }) {
    return PokemonDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      description: description ?? this.description,
    );
  }
}
