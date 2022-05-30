import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/models.dart';

class Firestorerepository {
  const Firestorerepository(
    FirebaseFirestore firebaseFirestore,
  ) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  static const _tableLimit = 10;
  static const _tableCollectionName = 'collectionName';
  static const _idtable = 'fieldName';

  Future<List<SomeModel>> fetchList() async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection(_tableCollectionName)
          .orderBy(_idtable, descending: true)
          .limit(_tableLimit)
          .get();
      final documents = querySnapshot.docs;
      return documents.toDataList();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}

extension on List<QueryDocumentSnapshot> {
  List<SomeModel> toDataList() {
    final itemModel = <SomeModel>[];
    for (final document in this) {
      final data = document.data() as Map<String, dynamic>?;
      if (data != null) {
        try {
          itemModel.add(SomeModel.fromJson(data));
        } catch (error) {
          throw Exception(error);
        }
      }
    }
    return itemModel;
  }
}
