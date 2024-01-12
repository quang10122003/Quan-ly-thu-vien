import 'package:flutter/material.dart';
import './book.dart';

class LibraryManager extends ChangeNotifier {
  List<Book> listBook = [ // quản lý tổng sách trong thư viện 
    Book(id: 123456, name_book: "quang", so_luong: 2),
    Book(id: 123454, name_book: "quaavng", so_luong: 2),
    Book(id: 123452, name_book: "quanag", so_luong: 2),
  ];
  
}
