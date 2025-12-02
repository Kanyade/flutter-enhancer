extension Group<T> on Iterable<T> {
  /// Groups the elements of the iterable by a specified [key] function.
  /// The result is a map where each key corresponds to a list of elements
  /// that share the same key.
  ///
  /// Example usage:
  /// ```dart
  /// class Person {
  ///   final String name;
  ///   final String role;
  ///   const Person(this.name, this.role);
  /// }
  ///
  /// void main() {
  ///   List<Person> people = const [
  ///     Person('John', 'Manager'),
  ///     Person('Alice', 'Engineer'),
  ///     Person('Bob', 'Engineer'),
  ///     Person('Charlie', 'Manager'),
  ///     Person('Eve', 'Designer'),
  ///   ];
  ///
  ///   Map<String, Iterable<Person>> groupedPeople = people.groupBy((person) => person.role);
  ///
  ///   groupedPeople.forEach((role, people) {
  ///     print('$role: ${people.map((person) => person.name).join(', ')}');
  ///   });
  /// }
  /// ```
  Map<K, Iterable<T>> groupBy<K>(K Function(T element) key) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final keyValue = key(element);
      if (!map.containsKey(keyValue)) {
        map[keyValue] = [];
      }
      map[keyValue]?.add(element);
    }
    return map;
  }
}
