import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/models/slider_model.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => SliderModel());
  }
}
