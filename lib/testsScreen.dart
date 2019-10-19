import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

// import 'package:career_guidance/model/model.dart';
// import 'package:career_guidance/redux/actions.dart';
// import 'package:career_guidance/redux/reducers.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/professiograms.json'),
          builder: (context, snapshot) {
            List<String> names = json
                .decode(snapshot.data.toString())
                .cast<Map<String, dynamic>>()['professiograms']
                .map((json) => Text(json['name']));
          },
        ),
      ),
    );
  }
}
