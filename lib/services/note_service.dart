import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

class NoteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection reference for a specific user's notes
  CollectionReference<Map<String, dynamic>> _userNotes(String userId) {
    return _firestore.collection('users').doc(userId).collection('notes');
  }

  // Real-time stream of notes for the current user
  Stream<List<Note>> getNotesStream(String userId) {
    return _userNotes(userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    });
  }

  // Add a new note
  Future<void> addNote(Note note) async {
    await _userNotes(note.userId).add(note.toMap());
  }

  // Update an existing note
  Future<void> updateNote(Note note) async {
    await _userNotes(note.userId).doc(note.id).update(note.toMap());
  }

  // Delete a note
  Future<void> deleteNote(String userId, String noteId) async {
    await _userNotes(userId).doc(noteId).delete();
  }

  // Toggle pinned status of a note
  Future<void> togglePin(String userId, String noteId, bool currentPinned) async {
    await _userNotes(userId).doc(noteId).update({
      'isPinned': !currentPinned,
      'updatedAt': Timestamp.now(),
    });
  }
}
