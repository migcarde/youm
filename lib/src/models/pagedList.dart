import 'headers/pagination.dart';

class PagedList<T> {
  int totalCount;
  int pageSize;
  int currentPage;
  int totalPages;
  List<T> items;

  PagedList(
      {this.totalCount,
      this.pageSize,
      this.currentPage,
      this.totalPages,
      this.items});

  factory PagedList.fromJson(Pagination pagination, List<T> items) {
    return PagedList(
        totalCount: pagination.totalCount,
        pageSize: pagination.pageSize,
        currentPage: pagination.currentPage,
        totalPages: pagination.totalPages,
        items: items);
  }
}
