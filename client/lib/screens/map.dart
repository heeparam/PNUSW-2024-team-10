import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heron_app/constants/theme/colors.dart';
import 'package:heron_app/constants/theme/typography.dart';
import 'package:heron_app/widgets/common/appbar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _latitude = 35.14322131348228;
  double _longitude = 129.02698069810867;
  double _zoom = 10.628889083862305;
  double _bearing = 23.771248378023493;

  @override
  Widget build(BuildContext context) {
    final colors = getColors(context);
    final typography = getTypography(context);

    return Scaffold(
        appBar: HeronAppBar(child: Text("Map", style: typography.h1)),
        body: Stack(children: [
          GoogleMap(
              mapType: MapType.normal,
              compassEnabled: false,
              myLocationButtonEnabled: false,
              style: mapStyle,
              onCameraMove: (CameraPosition position) {
                setState(() {
                  _latitude = position.target.latitude;
                  _longitude = position.target.longitude;
                  _zoom = position.zoom;
                  _bearing = position.bearing;
                });
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(_latitude, _longitude),
                  zoom: _zoom,
                  bearing: _bearing)),
          Positioned(
              top: 0.0,
              left: 0.0,
              child: Row(children: [
                Text(
                  "latitude: $_latitude \n longitude: $_longitude \n zoom: $_zoom \n bearing: $_bearing",
                ),
              ])),
        ]));
  }
}

const String mapStyle = """[
  {
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "stylers": [
      {
        "visibility": "simplified"
      }
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "simplified"
      }
    ]
  }
]""";
