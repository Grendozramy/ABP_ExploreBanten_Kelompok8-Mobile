import 'package:auto_size_text/auto_size_text.dart';
import 'package:explore_banten_mobile/models/post_models.dart';
import 'package:explore_banten_mobile/providers/post_providers.dart';
import 'package:explore_banten_mobile/ui/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import '../../shared/theme.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'zoombuttons_plugin_option.dart';

const MARKER_SIZE_EXPANDED = 55.0;
const MARKER_SIZE_SHRIKNKED = 35.0;

class MapsPage extends StatefulWidget {
  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>
    with SingleTickerProviderStateMixin {
  MapController mapController = MapController();
  late final AnimationController _animationController;

  final _pageController = PageController();
  int _selectedIndex = 0;
  final mylocation = LatLng(-6.780250199190997, 106.4099449785487);
  final streetStyle =
      "https://api.mapbox.com/styles/v1/grendo/cl4bivaon000o15o3280zt4ke/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ3JlbmRvIiwiYSI6ImNsMjFiemJ1azEzdTczYm10MzZjYXBjc2gifQ.096jeuPsN3yecA_ZOWOemw";

  void _onMapCreated(MapController controller) {
    mapController = controller;
  }

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < PlacesProvider.places.length; i++) {
      final mapItem = PlacesProvider.places[i];
      _markerList.add(
        Marker(
            height: MARKER_SIZE_EXPANDED,
            width: MARKER_SIZE_EXPANDED,
            point: LatLng(mapItem.latitude, mapItem.longitude),
            builder: (_) {
              return GestureDetector(
                onTap: () {
                  _selectedIndex = i;
                  setState(() {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceInOut,
                    );
                    print('Selected: ${mapItem.title1}');
                  });
                },
                child: LocationMarker(
                  selected: _selectedIndex == i,
                ),
              );
            }),
      );
    }

    return _markerList;
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
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
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              onMapCreated: _onMapCreated,
              center: mylocation,
              minZoom: 5,
              maxZoom: 20,
              zoom: 13,
              plugins: [
                ZoomButtonsPlugin(),
              ],
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: streetStyle,
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiZ3JlbmRvIiwiYSI6ImNsMjFiemJ1azEzdTczYm10MzZjYXBjc2gifQ.096jeuPsN3yecA_ZOWOemw',
                  'id': 'mapbox.mapbox-streets-v7',
                },
              ),
              MarkerLayerOptions(
                markers: _markers,
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                      height: 50,
                      width: 50,
                      point: mylocation,
                      builder: (_) {
                        return MyLocationMarker(_animationController);
                      })
                ],
              )
            ],
            nonRotatedLayers: [
              ZoomButtonsPluginOption(
                minZoom: 4,
                maxZoom: 19,
                mini: true,
                padding: 10,
                alignment: Alignment.topRight,
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: _pageController,
              itemCount: PlacesProvider.places.length,
              itemBuilder: (context, index) {
                final item = PlacesProvider.places[index];
                return _MapItemDetal(places: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LocationMarker extends StatelessWidget {
  const LocationMarker({Key? key, this.selected = false}) : super(key: key);

  final bool selected;
  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRIKNKED;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Image.asset(
          'assets/img/custom-icon.png',
        ),
      ),
    );
  }
}

class MyLocationMarker extends AnimatedWidget {
  const MyLocationMarker(Animation<double> animation, {Key? key})
      : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(0.5, 1.0, value)!;
    const size = 50.0;
    return Center(
        child: Stack(
      children: [
        Center(
          child: Container(
            height: size * newValue,
            width: size * newValue,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.5),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ));
  }
}

class _MapItemDetal extends StatelessWidget {
  const _MapItemDetal({Key? key, required this.places}) : super(key: key);

  final PlacesModel places;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Image.network(
                        // places.images[0].image,
                        'https://cdn.pixabay.com/photo/2016/11/29/03/28/eagle-1867067_960_720.jpg',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          places.title1,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          places.address1,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostPage1(places),
                ),
              ),
              color: kPrimaryColor,
              elevation: 6,
              child: Text(
                'Lihat Selengkapnya',
                style: whiteTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
