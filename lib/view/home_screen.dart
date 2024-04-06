import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/view/widgets/app_bar.dart';
import 'package:flutter_social_media_pegion_post_app/view/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgetPref(context),
      endDrawer: const DrawerWidget(),
      body: Center(),
    );
  }
}
