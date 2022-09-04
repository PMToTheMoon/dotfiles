import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:vector_tile_renderer/vector_tile_renderer.dart' as vector_tile;
import 'package:vector_map_tiles/vector_map_tiles.dart';

const double _initialZoom = 11;
final LatLng _paris = LatLng(48.8566, 2.3522);
const double _minZoom = 9;
const double _maxZoom = 18;

class Map extends StatefulWidget {
  const Map({
    Key? key,
    this.departure,
    this.arrival,
    bool gestureEnabled = true,
  })  : _interactiveFlags = gestureEnabled
            ? InteractiveFlag.all ^ InteractiveFlag.rotate
            : InteractiveFlag.none,
        super(key: key);

  final Address? departure;
  final Address? arrival;
  final int _interactiveFlags;

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  _MapState();

  final MapController _controller = MapController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //Invisible markers workaround
      Future.delayed(
        const Duration(milliseconds: 300),
        _setMapView,
      );
    });
  }

  @override
  void didUpdateWidget(Map oldWidget) {
    if (oldWidget.arrival != widget.arrival ||
        oldWidget.departure != widget.departure) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //Invisible markers workaround
        Future.delayed(
          const Duration(milliseconds: 300),
          _setMapView,
        );
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _setMapView() {
    final d = widget.departure?.center.toLatLng;
    final a = widget.arrival?.center.toLatLng;
    if (a != null && d != null && d != a) {
      final bounds = LatLngBounds.fromPoints([
        d,
        a,
      ]);
      // bounds.
      _controller.fitBounds(bounds,
          options: const FitBoundsOptions(
            padding: Padding1.all(),
            maxZoom: _maxZoom,
          ));
    } else if (d != null) {
      _controller.move(d, _controller.zoom);
    } else if (a != null) {
      _controller.move(a, _controller.zoom);
    } else {
      _controller.move(_paris, _initialZoom);
    }
  }

  @override
  Widget build(BuildContext context) {
    final departure = widget.departure;
    final arrival = widget.arrival;

    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            mapController: _controller,
            options: MapOptions(
              center: _paris,
              zoom: _initialZoom,
              interactiveFlags: widget._interactiveFlags,
              maxZoom: _maxZoom,
              minZoom: _minZoom,
              // plugins: [VectorMapTilesPlugin()],
            ),
            layers: [
              // VectorTileLayerOptions(
              //   theme: _mapTheme(context),
              //   tileProviders: TileProviders(
              //     {'openmaptiles': _cachingTileProvider(_urlTemplate())},
              //   ),
              // ),
              TileLayerOptions(
                maxZoom: _maxZoom,
                minZoom: _minZoom,

                urlTemplate:
                    "https://map.urban-driver.com/styles/basic-preview/{z}/{x}/{y}.png",
                // "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                // "https://{s}.mapbox.com/v4/mapbox.satellite/{z}/{x}/{y}.png?style=mapbox://styles/mapbox/streets-v11&access_token=pk.eyJ1Ijoic2FjcmVlIiwiYSI6ImNqdWJlMHA1YjBiam80NHBpZjE0OWhtODUifQ.0OjXeCAVjBRhjYgznfyaxA",
                // subdomains: ['a', 'b', 'c'],
                // attributionBuilder: (_) {
                //   return Text("© OpenStreetMap contributors");
                // },
              ),
              MarkerLayerOptions(
                markers: [
                  if (departure != null) departure.toDepartureMarker(context),
                  if (arrival != null) arrival.toArrivalMarker(context),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  VectorTileProvider _cachingTileProvider(String urlTemplate) {
    return MemoryCacheVectorTileProvider(
        delegate: NetworkVectorTileProvider(
          urlTemplate: urlTemplate,
          // this is the maximum zoom of the provider, not the
          // maximum of the map. vector tiles are rendered
          // to larger sizes to support higher zoom levels
          maximumZoom: 14,
        ),
        maxSizeBytes: 1024 * 1024 * 2);
  }

  _mapTheme(BuildContext context) {
    // maps are rendered using themes
    // to provide a dark theme do something like this:
    // if (MediaQuery.of(context).platformBrightness == Brightness.dark) return myDarkTheme();
    return vector_tile.ProvidedThemes.lightTheme();
    // return lightTheme();
  }

  String _urlTemplate() {
    // Stadia Maps source https://docs.stadiamaps.com/vector/
    // return 'https://tiles.stadiamaps.com/data/openmaptiles/{z}/{x}/{y}.pbf?api_key=$apiKey';

    // Mapbox source https://docs.mapbox.com/api/maps/vector-tiles/#example-request-retrieve-vector-tiles
    return 'https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.mvt?access_token=pk.eyJ1Ijoic2FjcmVlIiwiYSI6ImNqdWJlMHA1YjBiam80NHBpZjE0OWhtODUifQ.0OjXeCAVjBRhjYgznfyaxA&style=mapbox://styles/mapbox/streets-v11@00';
  }
}

extension _ToLatLng on List<double> {
  LatLng get toLatLng {
    return LatLng(this[1], this[0]);
  }
}

extension _ToMarker on Address {
  Marker toDepartureMarker(BuildContext context) {
    return Marker(
      point: center.toLatLng,
      builder: (ctx) => Assets.images.departure.image(),
    );
  }

  Marker toArrivalMarker(BuildContext context) {
    return Marker(
      point: center.toLatLng,
      builder: (ctx) => Assets.images.arrival.image(),
      // builder: (ctx) => Icon(Icons.person),
    );
  }
}
