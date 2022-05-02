part of 'pokemon_bloc.dart';

enum PokemonStatus {
  initial,
  loading,
  success,
  error,
}

class PokemonState extends Equatable {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;
  final Error error;
  final PokemonStatus status;
  const PokemonState({
    required this.pokemonListings,
    required this.canLoadNextPage,
    required this.error,
    required this.status,
  });

  factory PokemonState.initial() {
    return PokemonState(
      pokemonListings: const [],
      canLoadNextPage: false,
      error: Error(),
      status: PokemonStatus.initial,
    );
  }

  @override
  List<Object> get props => [pokemonListings, canLoadNextPage, error, status];

  @override
  String toString() {
    return 'PokemonState(pokemonListings: $pokemonListings, canLoadNextPage: $canLoadNextPage, error: $error, status: $status,)';
  }

  PokemonState copyWith({
    List<PokemonListing>? pokemonListings,
    bool? canLoadNextPage,
    Error? error,
    PokemonStatus? status,
  }) {
    return PokemonState(
      pokemonListings: pokemonListings ?? this.pokemonListings,
      canLoadNextPage: canLoadNextPage ?? this.canLoadNextPage,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
