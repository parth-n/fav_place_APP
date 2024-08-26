import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place_x/providers/userprovider.dart';
import 'package:place_x/screens/add_place.dart';
import 'package:place_x/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddPlaceScreen(),
                ));
              },
              icon: const Icon(Icons.add_a_photo_rounded)),
        ],
      ),
      body: PlacesList(
        places: userPlaces,
      ),
    );
  }
}
