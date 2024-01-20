import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:quan_ly_thu_vien_flutter/model/sinh_vien.dart';
=======
>>>>>>> b7a90941563252db299f41b8d1d7cc21238cc267
import 'package:quan_ly_thu_vien_flutter/wiget/setting_form/setting.dart';
import 'package:quan_ly_thu_vien_flutter/wiget/tra_sach_form/tra_sach.dart';
import './model/Quan_ly_thu_vien.dart';
import './model/trang_thai.dart';
import './wiget/quan_ly_sach_form/quan_ly_sach_form.dart';
import 'package:provider/provider.dart';
import './wiget/muon_sach_form/muon_sach.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
<<<<<<< HEAD
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LibraryManager>(
            create: (context) => LibraryManager()),
        ChangeNotifierProvider<Trang_thai>(create: (context) => Trang_thai()),
        ChangeNotifierProvider(create: (_) => BorrowingFunction()),
        ChangeNotifierProvider(create: (_) => StudentManager()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Quan_ly_sach_form(),
          '/muon_sach': (context) => Muon_sach(),
          '/tra_sach': (context) => Tra_sach(),
          '/setting': (context) => Setting(),
        },
      ),
    );
=======
     return MultiProvider(providers: [
      ChangeNotifierProvider<LibraryManager>(create: (context)=>LibraryManager()),
      ChangeNotifierProvider<Trang_thai>(create: (context)=>Trang_thai())
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Quan_ly_sach_form(),
        '/muon_sach': (context) => Muon_sach(),
        '/tra_sach':(context) => Tra_sach(),
        '/setting':(context) => Setting(),
      },
    ),);
>>>>>>> b7a90941563252db299f41b8d1d7cc21238cc267
  }
}

void main() {
  runApp(MyApp());
<<<<<<< HEAD
}
=======
}
>>>>>>> b7a90941563252db299f41b8d1d7cc21238cc267
