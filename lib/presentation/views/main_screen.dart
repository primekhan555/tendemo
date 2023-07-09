import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendemo/presentation/common_widgets/custom_app_bar.dart';
import 'package:tendemo/presentation/views/dashboard_section/dashboard_component.dart';
import 'package:tendemo/presentation/views/media_library_section/media_library_component.dart';
import 'package:tendemo/presentation/views/more_section/more_component.dart';
import 'package:tendemo/presentation/views/watch_section/watch_component.dart';
import 'package:tendemo/providers/watch_provider.dart';

import '../common_widgets/custom_bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "main_screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selected = 1;
  changeIndex(int index) {
    selected = index;
    setState(() {});
  }

  List<Widget> widgetList = [
    const DashboardComponent(),
    const WatchComponent(),
    const MediaLibraryComponent(),
    const MoreComponent()
  ];
@override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WatchProvider>().getUpComingMovie();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size(double.infinity, 77), child: CustomAppBar()),
      body: widgetList.elementAt(selected),
        bottomNavigationBar: CustomBottomNavigation(
            selectedIndex: selected, onTap: (i) => changeIndex(i)));
  }
}
