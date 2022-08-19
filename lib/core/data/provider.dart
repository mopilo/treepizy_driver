import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:treepizy_driver/features/auth/presentation/provider/vehicle_provider.dart';
import 'package:treepizy_driver/features/home/provider/home_provider.dart';

import '../injection/injection_container.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => VehicleProvider(inject()))
  ];
}
