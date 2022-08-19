import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';
import 'package:treepizy_driver/features/drawer/drawer.dart';
import 'header.dart';
import 'provider/home_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  late GoogleMapController mapController;

  HomeProvider? _homeProvider;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _homeProvider?.obtainPermission(context);
  }

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 11,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // location.onLocationChanged.listen((l) {
    _homeProvider?.locationService.onLocationChanged.listen((presentLocation) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target:
                  LatLng(presentLocation.latitude!, presentLocation.longitude!),
              zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Completer<GoogleMapController> _controller = Completer();
    return Scaffold(
        drawer: const MenuDrawer(),
        key: _scaffoldKey,
        body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
          return Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                tiltGesturesEnabled: false,
                myLocationEnabled: true,
                compassEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: _onMapCreated,
              ),

              ///empty move
              Positioned(
                child: SizedBox(
                  height: 150,
                  child: AppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight: 100,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(100),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Header(drawerClick: () {
                              _scaffoldKey.currentState?.openDrawer();
                             
                            }),
                          
                          ]),
                        ),
                      ),
                      backgroundColor: Colors.white.withOpacity(0.85),
                      elevation: 0,
                     ),
                ),
              )

              // : Container(),
              /// BOTTOM ITEMS  ///

              //  BottomWidget(
              //         selectedWidgetMarker: selectedWidgetMarker,
              //         pressed: (presentState) {
              //           setState(() {
              //             selectedWidgetMarker = presentState;
              //           });
              //         })
            ],
          );
        }));
  }
}
