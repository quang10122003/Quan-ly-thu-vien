import 'package:flutter/material.dart';
import 'package:quan_ly_thu_vien_flutter/model/borrowed_book.dart';
import './book.dart';

class LibraryManager extends ChangeNotifier {
  List<Book> listBook = [
    // quan lý tong sách trong thư viện
    Book(id: 123456, name_book: "quang", so_luong: 2, so_luong_da_muon: 2),
    Book(id: 123454, name_book: "quaavng", so_luong: 2),
    Book(id: 123452, name_book: "quanag", so_luong: 2),
  ];
  // Hàm hiển thị dialog thông báo lỗi
  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Lỗi"),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showSuccessMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          backgroundColor: Colors.green,
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // lay book tu id book
  Book? select_book(int id) {
    for (int i = 0; i < listBook.length; i++) {
      if (id == listBook[i].id) {
        return listBook[i];
      }
    }

    return null;
  }

// ham them sach moi vao thu vien
  void addBook(BuildContext context, Book book) {
    bool isID = listBook.any((element) {
      return element.id == book.id;
    });

    if (isID == false) {
      listBook.add(book);
      notifyListeners();
    } else {
      // Hiển thị thông báo lỗi không sử dụng thêm thư viện
      showErrorDialog(context, "Sách với ID ${book.id} đã tồn tại.");
    }
  }

  void deleteBook(BuildContext context, int index) {
    if (listBook[index].so_luong_da_muon == 0) {
      final removedBook = listBook.removeAt(index);
      showSuccessMessage(context, "đã xóa sách có id: ${removedBook.id}");
      notifyListeners();
    } else {
      showErrorDialog(context, "đang có người mượn sách, không thể xóa");
    }
  }

  void editBook(BuildContext context, int index, Book book) {
    listBook[index] = book;
    if (book.so_luong_da_muon < listBook[index].so_luong) {
      if (listBook[index].co_the_muon == false) {
        listBook[index].co_the_muon = true;
      }
      showSuccessMessage(context, "đã sửa sách có id: ${listBook[index].id}");
      notifyListeners();
    } else if (book.so_luong_da_muon == listBook[index].so_luong) {
      listBook[index].co_the_muon = false;
      showSuccessMessage(context, "đã sửa sách có id: ${listBook[index].id}");
      notifyListeners();
    }
  }

  void returnBook(BuildContext context, int index, Book selectedBook) {
    Book returnbook = listBook.firstWhere((element) => element.id == selectedBook.id);
    int idx = listBook.indexOf(returnbook);
    listBook[idx].so_luong_da_muon --;
    notifyListeners();
  }
}
