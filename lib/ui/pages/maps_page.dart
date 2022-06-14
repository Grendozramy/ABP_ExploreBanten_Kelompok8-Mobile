import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatelessWidget {
  var points = <LatLng>[
    new LatLng(-6.732257953181979, 105.50034602689583),
    new LatLng(-6.01437603546215, 106.06339531104375),
    new LatLng(-6.914975375252903, 106.3325603346852),
    new LatLng(-6.732257953181979, 105.50034602689583),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBGColor,
          title: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: kPrimaryColor,
                  width: 3.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Maps',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 40),
          child: FlutterMap(
              options: MapOptions(
                center: LatLng(-6.407561526553379, 106.082621384161),
                minZoom: 10.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/grendo/cl4bivaon000o15o3280zt4ke/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ3JlbmRvIiwiYSI6ImNsMjFiemJ1azEzdTczYm10MzZjYXBjc2gifQ.096jeuPsN3yecA_ZOWOemw",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoiZ3JlbmRvIiwiYSI6ImNsMjFiemJ1azEzdTczYm10MzZjYXBjc2gifQ.096jeuPsN3yecA_ZOWOemw',
                    'id': 'mapbox.mapbox-streets-v7',
                  },
                ),
                MarkerLayerOptions(markers: [
                  Marker(
                      width: 45.0,
                      height: 45.0,
                      point: LatLng(-6.407561526553379, 106.082621384161),
                      builder: (context) => Container(
                            child: IconButton(
                              icon: Icon(Icons.location_on),
                              color: Colors.red,
                              iconSize: 45.0,
                              onPressed: () {
                                print('Marker tapped');
                              },
                            ),
                          ))
                ]),
                new PolylineLayerOptions(polylines: [
                  new Polyline(
                      points: points, strokeWidth: 5.0, color: Colors.red)
                ])
              ]),
        ));
  }
}
