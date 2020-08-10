import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/services/store.dart';
import 'package:stacked/stacked.dart';

class DashboardNotesViewModel extends FutureViewModel<List<Note>> {
  StoreService _storeService = locator<StoreService>();

  @override
  Future<List<Note>> futureToRun() {
    return _storeService.database.noteDao.findAllNotes();
  }
}
