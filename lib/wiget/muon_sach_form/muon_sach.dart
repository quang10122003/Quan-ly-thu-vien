import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:quan_ly_thu_vien_flutter/model/Quan_ly_thu_vien.dart';
import 'package:quan_ly_thu_vien_flutter/model/book.dart';
import 'package:quan_ly_thu_vien_flutter/model/borrowing_record.dart';
import 'package:quan_ly_thu_vien_flutter/model/sinh_vien.dart';

class BookNotifier extends ChangeNotifier { 
  Book _book; // Đây là một biến thể hiện của lớp Book. Biến _book sẽ lưu trữ thông tin về một cuốn sách.
  BookNotifier(this._book); // Đây là một constructor của lớp BookNotifier. Nó nhận một tham số _book để khởi tạo giá trị của biến _book khi một đối tượng BookNotifier được tạo.
  Book get book => _book; //Đây là một getter method cho biến _book. Nó cho phép bên ngoài đọc giá trị của _book mà không cần phải sử dụng phương thức truy cập.
  set book(Book newBook) { //Đây là một setter method cho biến _book. Khi giá trị của _book được thay đổi thông qua setter này, nó gọi notifyListeners() để thông báo về sự thay đổi. 
    _book = newBook;
    notifyListeners();
  }
}

class Muon_sach extends StatelessWidget {
  final TextEditingController bookIdController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //trở về trang trước
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Borrow Book Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: bookIdController,
              decoration: InputDecoration(labelText: "Book ID"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: studentIdController,
              decoration: InputDecoration(labelText: "Student ID"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BorrowingFunction borrowingFunction =
                    Provider.of<BorrowingFunction>(context, listen: false);
                borrowingFunction.borrowBook(
                  context,
                  bookIdController.text,
                  studentIdController.text,
                );
              },
              child: Text("Borrow Book"),
            ),
            SizedBox(
              height: 10,
            ),
            //thêm danh sách đã mượn
            Expanded(
              child: Consumer<BorrowingFunction>(
                builder: (context, borrowingFunction, child) {
                  return ListView.builder(
                    itemCount: borrowingFunction.borrowedRecords.length,
                    itemBuilder: (context, index) {
                      var record = borrowingFunction.borrowedRecords[index];
                      return Card(
                        elevation: 5,
                        color: (index) % 2 == 0 ? Colors.blue : Colors.red,
                        child: ListTile(
                          leading: Icon(Icons.book),
                          title: Text(
                            "Tên sách: ${record.book.name_book}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID: ${record.book.id}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Số lượng đã mượn: ${record.book.so_luong_da_muon}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Người mượn: ${record.borrower.name}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
=======
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
>>>>>>> b7a90941563252db299f41b8d1d7cc21238cc267
        ),
      ),
    );
  }
<<<<<<< HEAD
}

class BorrowingFunction with ChangeNotifier {
  List<BorrowingRecord> borrowedRecords = []; //Đây là một danh sách (List) chứa các đối tượng BorrowingRecord. Đối tượng này có thể được sử dụng để theo dõi các thông tin về việc mượn sách.
  void borrowBook(BuildContext context, String bookId, String studentId) async {
    int parsedBookId = int.tryParse(bookId) ?? 0;//Dòng này cố gắng chuyển đổi giá trị của bookId từ kiểu String sang int bằng int.tryParse(). Nếu chuyển đổi không thành công, parsedBookId sẽ được gán giá trị mặc định là 0.
    LibraryManager libraryManager =
        Provider.of<LibraryManager>(context, listen: false);
    StudentManager studentManager =
        Provider.of<StudentManager>(context, listen: false);
    Book selectedBook; //Khai báo một biến selectedBook kiểu Book để lưu trữ thông tin về cuốn sách mà người dùng muốn mượn.
    try { //sử dụng một khối try-catch để thử nghiệm việc tìm kiếm cuốn sách trong danh sách libraryManager.listBook dựa trên parsedBookId
      selectedBook = libraryManager.listBook.firstWhere(
        (book) => book.id == parsedBookId,
      );
      performBorrowing(context, studentId, selectedBook);
    } catch (e) {
      showErrorDialog(context, "Book not found or invalid Book ID.");
    }
  }

  void performBorrowing(
      BuildContext context, String studentId, Book selectedBook) async {
    LibraryManager libraryManager =
        Provider.of<LibraryManager>(context, listen: false);
    StudentManager studentManager =
        Provider.of<StudentManager>(context, listen: false);

    Student student = studentManager.students.firstWhere(
      (s) => s.id.toString() == studentId,
      //chuyển id kiểu int về string để so sánh
      orElse: () {
        print("Student with ID $studentId not found.");
        return Student(
            id: 0, name: ""); // Provide a default non-nullable Student
      },
    );

    if (student.id != 0) {
      BookNotifier bookNotifier = BookNotifier(selectedBook);
      Book borrowedBook = bookNotifier.book;
      if (borrowedBook.so_luong_da_muon < borrowedBook.so_luong) {
        borrowedBook.so_luong_da_muon++;
        print(
            "Book successfully borrowed by ${student.name}: ${borrowedBook.name_book}");
        //thêm danh sách đã mượn thành công vào list
        borrowedRecords
            .add(BorrowingRecord(book: selectedBook, borrower: student));
        notifyListeners();
        showSuccessMessage(context, "Book borrowed successfully.");
        bookNotifier.notifyListeners(); // Notify listeners for changes
      } else {
        print("${borrowedBook.name_book} is not available for borrowing.");
        showErrorDialog(context, "${borrowedBook.name_book} is not available.");
      }
    }
  }
=======

}
>>>>>>> b7a90941563252db299f41b8d1d7cc21238cc267
