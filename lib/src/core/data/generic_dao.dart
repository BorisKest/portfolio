abstract class GenericDao {
  /// Fetches a list of items from the database.
  Future<List<T>> fetchAll<T>();

  /// Fetches a single item by its ID from the database.
  Future<T?> fetchById<T>(String id);

  /// Inserts a new item into the database.
  Future<void> insert<T>(T item);

  /// Updates an existing item in the database.
  Future<void> update<T>(T item);

  /// Deletes an item by its ID from the database.
  Future<void> deleteById(String id);
}
