import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/pokemon_details.dart';
import '../../repository/pokemon_repository.dart';
import '../../service/pokemon_info_response.dart';
import '../../service/pokemon_species_info_response.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final _pokemonRepository = PokemonRepository();
  PokemonDetailsBloc() : super(PokemonDetailsState.initial()) {
    on<PokemonDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DetailsPageRequestEvent>(_getPokemonDetails);
  }

  Future<void> _getPokemonDetails(
      DetailsPageRequestEvent event, Emitter emit) async {
    emit(state.copyWith(status: PokemonDetailsStatus.loading));
    print(state.status);
    print('detailsBlocPokemonID : ${event.pokemonId}');

    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(event.pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(event.pokemonId),
    ]);
    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;
    try {
      emit(state.copyWith(
        status: PokemonDetailsStatus.success,
        pokemonDetails: PokemonDetails(
          id: pokemonInfo.id,
          name: pokemonInfo.name,
          imageUrl: pokemonInfo.imageUrl,
          types: pokemonInfo.types,
          height: pokemonInfo.height,
          weight: pokemonInfo.weight,
          description: speciesInfo.description,
        ),
      ));
      print(state.status);
    } on Error catch (e) {
      emit(state.copyWith(
        status: PokemonDetailsStatus.error,
        error: e,
      ));
      print(state.status);
    }
  }
}
