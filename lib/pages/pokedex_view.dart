import 'package:day16_pokedex_app/bloc/pokemon_details/pokemon_details_bloc.dart';
import 'package:day16_pokedex_app/pages/pokemon_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pokemon/pokemon_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state.status == PokemonStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == PokemonStatus.success) {
            return GridView.builder(
              itemCount: state.pokemonListings.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                final int pokemonId = state.pokemonListings[index].id;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PokemonDetailsView(),
                      ),
                    );
                    context
                        .read<PokemonDetailsBloc>()
                        .add(DetailsPageRequestEvent(pokemonId: pokemonId));
                  },
                  child: Card(
                    elevation: 4,
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListings[index].imageUrl),
                          Text(state.pokemonListings[index].name.toUpperCase()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state.status == PokemonStatus.error) {
            return Center(
              child: Text('error: ${state.error.toString()}'),
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
