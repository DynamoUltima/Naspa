// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

const kGoogleApiKey = "API_KEY";

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class TowMePage extends StatefulWidget {
  const TowMePage({Key? key, required this.pageTitle}) : super(key: key);
  final String pageTitle;

  @override
  _TowMePageState createState() => _TowMePageState();
}

final searchScaffoldKey = GlobalKey<ScaffoldState>();

class _TowMePageState extends State<TowMePage> {
  Mode _mode = Mode.overlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.teal),
        elevation: 10,
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        title: Text(
          widget.pageTitle,
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: FormBuilder(
        child: Column(
          
          children: [
            SizedBox(height: 15,),
            FormBuilderTextField(
              name: 'pick up point',
              // maxLines: 5,
              // minLines: 1,
              // autofillHints: ['Add short notes'],
              decoration: InputDecoration(
                hintText: 'pick up',
                // contentPadding: EdgeInsets.only(left: 48),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.gps_fixed),
              ),
            ),
            Divider(color:Colors.black),
            FormBuilderTextField(
              name: 'drop off point',
              // maxLines: 5,
              // minLines: 1,
              // autofillHints: ['Add short notes'],
              decoration: InputDecoration(
                hintText: 'drop off point',
                // contentPadding: EdgeInsets.only(left: 48),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.gps_not_fixed),
              ),
            ),
            Divider(color:Colors.black),
            FormBuilderTextField(
              name: 'notes',
              maxLines: 5,
              minLines: 1,
              // autofillHints: ['Add short notes'],
              decoration: InputDecoration(
                hintText: 'Add short notes',
                // contentPadding: EdgeInsets.only(left: 48),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.short_text),
              ),
            ),
            Divider(color:Colors.black),
            Container(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //_buildDropdownMenu(),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(primary: Colors.teal),
                  onPressed: _handlePressButton,
                  child: const Text("Search location"),
                ),
                // ElevatedButton(
                //   child: Text("Custom"),
                //   onPressed: () {
                //     Navigator.of(context).pushNamed("/search");
                //   },
                // ),
              ],
            ))),
          ],
        ),
      ),
    );
  }

  // Widget _buildDropdownMenu() => DropdownButton(
  //       value: _mode,
  //       // ignore: prefer_const_literals_to_create_immutables
  //       items: <DropdownMenuItem<Mode>>[
  //         DropdownMenuItem<Mode>(
  //           child: Text("Overlay"),
  //           value: Mode.overlay,
  //         ),
  //         DropdownMenuItem<Mode>(
  //           child: Text("Fullscreen"),
  //           value: Mode.fullscreen,
  //         ),
  //       ],
  //       onChanged: (  m) {
  //         setState(() {
  //           //_mode = m;
  //         });
  //       },
  //     );

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response.errorMessage.toString())),
    );
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: "fr",
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, "gh")],
    );

    //displayPrediction(p!, homeScaffoldKey.currentState);
  }
}

Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
  if (p != null) {
    // get detail (lat/lng)
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId.toString());
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    // ignore: deprecated_member_use
    scaffold.showSnackBar(
      SnackBar(content: Text("${p.description} - $lat/$lng")),
    );
  }
}

class CustomSearchScaffold extends PlacesAutocompleteWidget {
  CustomSearchScaffold()
      : super(
          apiKey: kGoogleApiKey,
          sessionToken: Uuid().generateV4(),
          language: "en",
          components: [Component(Component.country, "uk")],
        );

  @override
  _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
}

class _CustomSearchScaffoldState extends PlacesAutocompleteState {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
    final body = PlacesAutocompleteResult(
      onTap: (p) {
        //displayPrediction(p, searchScaffoldKey.currentState);
      },
      logo: Row(
        children: [FlutterLogo()],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
    return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    searchScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response.errorMessage.toString())),
    );
  }

  // @override
  // void onResponse(PlacesAutocompleteResponse response) {
  //   super.onResponse(response);
  //   if (response != null && response.predictions.isNotEmpty) {
  //     // ignore: deprecated_member_use
  //     searchScaffoldKey.currentState!.showSnackBar(
  //       SnackBar(content: Text("Got answer")),
  //     );
  //   }
  // }
}

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}
