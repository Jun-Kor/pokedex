part of 'pokemon_details_bloc.dart';

enum PokemonDetailsStatus {
  initial,
  loading,
  success,
  error,
}

class PokemonDetailsState extends Equatable {
  final PokemonDetails pokemonDetails;
  final PokemonDetailsStatus status;
  final Error error;
  const PokemonDetailsState({
    required this.pokemonDetails,
    required this.status,
    required this.error,
  });

  factory PokemonDetailsState.initial() {
    return PokemonDetailsState(
      pokemonDetails: const PokemonDetails(
        id: 0,
        name: 'initial',
        description: 'initial',
        height: 0,
        imageUrl: '',
        types: [],
        weight: 0,
      ),
      status: PokemonDetailsStatus.initial,
      error: Error(),
    );
  }

  @override
  List<Object> get props => [pokemonDetails, status, error];

  @override
  String toString() =>
      'PokemonDetailsState(pokemonDetails: $pokemonDetails, status: $status, error: $error,)';

  PokemonDetailsState copyWith({
    PokemonDetails? pokemonDetails,
    PokemonDetailsStatus? status,
    Error? error,
  }) {
    return PokemonDetailsState(
      pokemonDetails: pokemonDetails ?? this.pokemonDetails,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
