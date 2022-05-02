import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_details/pokemon_details_bloc.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state.status == PokemonDetailsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PokemonDetailsStatus.success) {
            return Center(
              child: Text(state.pokemonDetails.name),
            );
          } else if (state.status == PokemonDetailsStatus.error) {
            return const Text(
              'error status',
              style: TextStyle(fontSize: 20),
            );
          } else {
            return const Center(
              child: Text('initial'),
            );
          }
        },
      ),
    );
  }
}
