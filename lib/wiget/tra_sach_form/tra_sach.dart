import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quan_ly_thu_vien_flutter/model/book.dart';
import 'package:quan_ly_thu_vien_flutter/wiget/component/Component.dart';
import 'package:quan_ly_thu_vien_flutter/model/Quan_ly_thu_vien.dart';
import 'package:quan_ly_thu_vien_flutter/model/borrowed_book.dart';

class SeclectedBookNoti extends ChangeNotifier {
  Book _book =
      Book(id: 123456, name_book: "quang", so_luong: 2, so_luong_da_muon: 2);

  Book get book => _book;

  set book(Book newBook) {
    _book = newBook;
    notifyListeners();
  }
}

class Tra_sach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    // final thu_vien = Provider.of<LibraryManager>(context);
    TextEditingController borrowedBookController = TextEditingController();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LibraryManager>(
            create: (context) => LibraryManager()),
        ChangeNotifierProvider<SeclectedBookNoti>(
            create: (context) => SeclectedBookNoti()),
        ChangeNotifierProvider<BorrowedBookManager>(
            create: (context) => BorrowedBookManager())
      ],
      child: Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          minimum: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height,
            child:
                Consumer<LibraryManager>(builder: (context, thu_vien, child) {
              return Column(
                children: [
                  buildNavButton(),
                  Consumer<SeclectedBookNoti>(
                      builder: (context, selectedBook, child) {
                    return Column(
                      children: [
                        DropdownMenu<Book>(
                          initialSelection: thu_vien.listBook.first,
                          controller: borrowedBookController,
                          requestFocusOnTap: true,
                          onSelected: (Book? book) {
                            selectedBook.book = book!;
                          },
                          label: Text('Id Book'),
                          dropdownMenuEntries: thu_vien.listBook
                              .map<DropdownMenuEntry<Book>>((Book book) =>
                                  DropdownMenuEntry<Book>(
                                      value: book, label: book.id.toString()))
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Tên sách: ${selectedBook._book.name_book}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Consumer<BorrowedBookManager>(
                            builder: (context, borrowed_list, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: borrowed_list.borrowedBook
                                .where((element) =>
                                    element.idBook == selectedBook._book.id)
                                .length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                color:
                                    (index) % 2 == 0 ? Colors.blue : Colors.red,
                                child: ListTile(
                                  title: Text(
                                    "Tên sinh viên: ${borrowed_list.borrowedBook.where((element) => element.idBook == selectedBook._book.id).elementAt(index).name}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ID sinh viên: ${borrowed_list.borrowedBook.where((element) => element.idBook == selectedBook._book.id).elementAt(index).idStudent}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  trailing: ElevatedButton(
                                    onPressed: (){
                                      thu_vien.returnBook(context, index, selectedBook._book);
                                      borrowed_list.returnBook(context, index, borrowed_list.borrowedBook.where((element) => element.idBook == selectedBook._book.id).elementAt(index));
                                    },
                                    child: Text('Trả sách'),
                                  ),
                                ),
                              );
                            },
                          );
                        })
                      ],
                    );
                  })
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
