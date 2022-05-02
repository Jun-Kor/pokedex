import 'package:bloc/bloc.dart';
import 'package:day16_pokedex_app/service/pokemon_page_response.dart';
import 'package:equatable/equatable.dart';

import '../../repository/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonState.initial()) {
    on<PokemonEvent>((event, emit) {});

    on<PokemonPageRequestEvent>((event, emit) async {
      emit(state.copyWith(status: PokemonStatus.loading));
      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPage(event.page);

        emit(state.copyWith(
          status: PokemonStatus.success,
          pokemonListings: pokemonPageResponse.pokemonListings,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage,
        ));
      } on Error catch (e) {
        emit(state.copyWith(
          status: PokemonStatus.error,
          error: e,
        ));
      }
    });
  }
}
