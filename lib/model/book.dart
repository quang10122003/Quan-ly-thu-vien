class Book {
  int id;
  String name_book;
  int so_luong;
  int so_luong_da_muon; // Số lượng sách đã được mượn
  bool co_the_muon; // Trạng thái sách có thể mượn hay không
  Book({
    required this.id,
    required this.name_book,
    required this.so_luong,
    this.so_luong_da_muon = 0,
    this.co_the_muon = true,
  });
}
