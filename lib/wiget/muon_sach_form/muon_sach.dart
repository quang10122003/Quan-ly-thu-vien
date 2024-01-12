import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quan_ly_thu_vien_flutter/wiget/component/Component.dart';

class Muon_sach extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        minimum: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height,
          child:Column(
            children: [
              buildNavButton(),
            ],
          ) ,
        ),
      ),
    );
  }

}