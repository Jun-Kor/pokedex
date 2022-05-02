part of 'pokemon_details_bloc.dart';

abstract class PokemonDetailsEvent extends Equatable {
  const PokemonDetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsPageRequestEvent extends PokemonDetailsEvent {
  final int pokemonId;
  const DetailsPageRequestEvent({
    required this.pokemonId,
  });
  @override
  List<Object> get props => [pokemonId];

  @override
  String toString() => 'DetailsPageRequestEvent(pokemonId: $pokemonId)';
}
