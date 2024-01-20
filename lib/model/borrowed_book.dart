import 'package:flutter/cupertino.dart';
import 'package:quan_ly_thu_vien_flutter/model/book.dart';

class BorrowedBook {
  int idBook;
  int idStudent;
  String name;
  BorrowedBook(
      {required this.idBook, required this.idStudent, required this.name});
}

class BorrowedBookManager extends ChangeNotifier {
  List<BorrowedBook> borrowedBook = [
    BorrowedBook(idBook: 123456, idStudent: 1, name: 'John'),
    BorrowedBook(idBook: 123456, idStudent: 2, name: 'Tom'),
    BorrowedBook(idBook: 12346, idStudent: 3, name: 'Tom'),
  ];
  void returnBook(BuildContext context, int index, BorrowedBook selectedBook) {
    borrowedBook.removeWhere((element) =>
        (element.idBook == selectedBook.idBook) &&
        (element.idStudent == selectedBook.idStudent));
    notifyListeners();
  }
}
