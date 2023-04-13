import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../blocs/_blocs.dart';
import '../views/_views.dart';
import '../widgets/_widgets.dart';
import '../providers/_providers.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapProv = Provider.of<MapProvider>(context);

    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          if (locationState.lastKnownLocation == null) {
            return const Center(child: Text('Espere por favor...'));
          }

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              Map<String, Polyline> polylines = Map.from(mapState.polylines);
              if (!mapState.showMyRoute) {
                polylines.removeWhere((key, value) => key == 'myRoute');
              }

              return Stack(
                children: [
                  MapView(
                    initialLocation: locationState.lastKnownLocation!,
                    polylines: polylines.values.toSet(),
                  ),
                  if (mapProv.small)
                    GestureDetector(
                      onTap: () {
                        mapProv.small = !mapProv.small;
                        Navigator.pushNamed(context, 'map');
                      },
                      child: Container(
                        height: 500,
                        width: 500,
                        color: Colors.transparent,
                      ),
                    ),
                  if (!mapProv.small) const SearchBar(),
                  if (!mapProv.small) const ManualMarker(),
                ],
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // BtnToggleUserRoute(),
          // BtnFollowUser(),
          if (!mapProv.small) const BtnCurrentLocation(),
        ],
      ),
    );
  }
}
