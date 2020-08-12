import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/services/store.dart';
import 'package:coding_blocks_junior/viewmodels/reloadable_future_viewmodel.dart';

class PlayerNotesViewModel extends ReloadableFutureViewModel<List<Note>> {
  StoreService _storeService = locator<StoreService>();

  Future<List<Note>> futureToRun() {
    return _storeService.database.noteDao.findAllNotes();
  }

  Future addSampleNote() async {
    _storeService.database.noteDao.insert(Note(
      content: 'Something note',
      videoId: 'bleh'
    ));
    await loadData();
    notifyListeners();
  }
}
