import 'headers/pagination.dart';

class PagedList {
  int totalCount;
  int pageSize;
  int currentPage;
  int totalPages;
  List<dynamic> items;

  PagedList({
    this.totalCount,
    this.pageSize,
    this.currentPage,
    this.totalPages,
    this.items
  });

  factory PagedList.fromJson(Pagination
   pagination, List<dynamic> items) {
    return PagedList(
      totalCount: pagination.totalCount,
      pageSize: pagination.pageSize,
      currentPage: pagination.currentPage,
      totalPages: pagination.totalPages,
      items: items
    );
  }
}