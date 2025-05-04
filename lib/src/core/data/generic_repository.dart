abstract class GenericRepository<T> {
  /// Fetches a list of items from the database.
  Future<List<T>> fetchAll();

  /// Fetches a single item by its ID from the database.
  Future<T?> fetchById(String id);

  /// Inserts a new item into the database.
  Future<void> insert(T item);

  /// Updates an existing item in the database.
  Future<void> update(T item);

  /// Deletes an item by its ID from the database.
  Future<void> deleteById(String id);
}
