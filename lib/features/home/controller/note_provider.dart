import 'package:flutter/foundation.dart';
import '../model/note_model.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];
  bool _isLoading = false;

  List<NoteModel> get notes => List.unmodifiable(_notes);
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void addNote({
    required String title,
    required String content,
    String category = 'Personal',
  }) {
    final newNote = NoteModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
      content: content.trim(),
      category: category,
      createdAt: DateTime.now(),
    );
    _notes.insert(0, newNote);
    notifyListeners();
  }

  void updateNote({
    required String id,
    required String title,
    required String content,
    String? category,
  }) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = _notes[index].copyWith(
        title: title.trim(),
        content: content.trim(),
        category: category ?? _notes[index].category,
        updatedAt: DateTime.now(),
      );
      notifyListeners();
    }
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  void togglePin(String id) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = _notes[index].copyWith(
        isPinned: !_notes[index].isPinned,
      );
      notifyListeners();
    }
  }

  List<NoteModel> filterNotes({
    required String category,
    required String query,
  }) {
    return _notes.where((note) {
      final matchesCategory = category == 'All Notes' ||
          category == 'All' ||
          note.category.toLowerCase() == category.toLowerCase();
      final matchesQuery = query.isEmpty ||
          note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.content.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }
}
