import 'package:day16_pokedex_app/pages/pokedex_view.dart';
import '../bloc/pokemon/pokemon_bloc.dart';
import '../bloc/pokemon_details/pokemon_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
            create: (context) =>
                PokemonBloc()..add(const PokemonPageRequestEvent(page: 0))),
        BlocProvider<PokemonDetailsBloc>(
            create: (context) => PokemonDetailsBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const PokedexView(),
      ),
    );
  }
}
