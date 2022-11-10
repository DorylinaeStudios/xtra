import 'table.dart';
import 'column.dart';

class Collection<T> {
    List<T> collection = [];

    operator [](int index) => collection[index];

    operator []=(int index, T value) {
        collection[index] = value;
    }

    void add(T value) {
        collection.add(value);
    }

    Collection (){}
}