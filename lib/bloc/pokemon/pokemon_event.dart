part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonPageRequestEvent extends PokemonEvent {
  final int page;
  const PokemonPageRequestEvent({
    required this.page,
  });

  @override
  List<Object> get props => [page];

  @override
  String toString() => 'PokemonPageRequestEvent(page: $page)';
}
