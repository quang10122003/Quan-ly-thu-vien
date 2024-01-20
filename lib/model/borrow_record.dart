import 'package:quan_ly_thu_vien_flutter/model/book.dart';
import 'package:quan_ly_thu_vien_flutter/model/sinh_vien.dart';

//thêm class danh sách người mượn
class BorrowingRecord {
  Book book;
  Student borrower;
  BorrowingRecord({required this.book, required this.borrower});
}