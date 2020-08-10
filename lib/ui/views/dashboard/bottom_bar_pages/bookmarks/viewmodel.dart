import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/services/store.dart';
import 'package:stacked/stacked.dart';

class DashboardBookmarksViewModel extends FutureViewModel<List<Bookmark>> {
  StoreService _storeService = locator<StoreService>();

  @override
  Future<List<Bookmark>> futureToRun() {
    return _storeService.database.bookmarkDao.findAllBookmarks();
  }
}
