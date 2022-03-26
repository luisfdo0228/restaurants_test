import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:tyba_provider/api/restaurants_api.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: TypeAheadField<Restaurant?>(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search City',
                ),
              ),
              suggestionsCallback: RestaurantApi.getNameCitys,
              itemBuilder: (context, Restaurant? suggestion) {
                final city = suggestion!;

                return ListTile(
                  title: Text(city.name),
                );
              },
              noItemsFoundBuilder: (context) => const SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'No City Found.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              onSuggestionSelected: (Restaurant? suggestion) {
                final city = suggestion!;

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text('Selected city: ${city.name}'),
                  ));
              },
            ),
          ),
        ),
      );
}