import 'package:flutter/material.dart';
import 'package:tendemo/extensions/build_context.dart';
import 'package:tendemo/navigation/params/home_screen_args.dart';
import 'package:provider/provider.dart';

import '../../api_resources/api_models/photos_model.dart';
import '../../api_resources/api_services/api_services.dart';
import '../../core/core.dart';
import '../../providers/home_provider.dart';
import '../base_widgets/base_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";
  final HomeScreenArgs? params;
  const HomeScreen({Key? key, this.params}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getAirline();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homePro = context.read<HomeProvider>();
    context.read<HomeProvider>().getAirline();
    return Scaffold(
        appBar: AppBar(
           actions: [
          IconButton(
              onPressed: () async {
                // http://www.africau.edu/images/default/sample.pdf
                Media media = await ApiServices().fileDownload(
                    '/images/default/sample.pdf', 'sample.pdf',
                    baseUrl: 'http://www.africau.edu');
                console(media.path);
              },
              icon: const Icon(Icons.download)),
        ]),
        body: Column(
          children: [
            Expanded(
              child: Consumer<HomeProvider>(builder: (context, pro, child) {
                return BaseWidget(
                  state: pro.airlineRes,
                  onRefresh: () => homePro.getAirline(),
                  builder: (context) {
                    List<PhotosModel> user = pro.airlineRes.data as List<PhotosModel>;
                    return ListView.builder(
                        itemCount: user.length,
                        itemBuilder: (BuildContext context, int index) {
                          PhotosModel data = user[index];
                          return ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data.thumbnailUrl ?? '')),
                            title: Text('${data.title}'),
                            subtitle: Text(data.title ?? ''),
                          );
                        });
                  },
                );
              }),
            ),
            Expanded(child: Column(children: [
              Text('${context.height}'),
              Text('${context.width}'),
              Text('${context.isKeyboardVisible}'),
              const TextField()
            ],))
          ],
        ));
  }
}
