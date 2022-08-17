import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:treepizy_driver/core/injection/injection_container.dart';
import 'package:treepizy_driver/features/home/provider/home_provider.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider(create: (_) => HomeProvider())
  ];
}
