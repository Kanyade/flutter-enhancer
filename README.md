# Flutter Enhancer

[![Version](https://img.shields.io/pub/v/flutter_enhancer.svg)](https://pub.dev/packages/flutter_enhancer) ![GitHub license](https://img.shields.io/badge/license-BSD3-blue.svg?style=flat)

### A huge set of Flutter utilities and extensions to make your development easier.

#### This package utilizes several extensions from the following open source [repository](https://github.com/vandadnp/flutter-tips-and-tricks/tree/main) in a slightly modified or completely unchanged state. This is an improved, curated and published version to make these and other useful extensions more accessible.

## Usage

Since it would still be an essay to write a concise usage guide for all 141 extensions, each one has an example usage in their documentation comments (///).

## Extensions

### Async Extensions

| Extension on         | Method/Property                    | Returns      | Description                                              |
| -------------------- | ---------------------------------- | ------------ | -------------------------------------------------------- |
| **T? Function()**    | `callWhen()`                       | `T?`         | Conditionally call a function based on a predicate       |
| **T? Function()**    | `debounce()`                       | `void`       | Debounce function execution with configurable duration   |
| **T? Function()**    | `periodic()`                       | `Timer`      | Create periodic timers for repeated function calls       |
| **T? Function()**    | `throttle()`                       | `void`       | Throttle function execution to limit call frequency      |
| **T Function()**     | `delayedCall()`                    | `Future<T>`  | Execute a function after a delay                         |
| **Future&lt;T&gt;**  | `onErrorJustReturn()`              | `Future<T>`  | Return a default value on error                          |
| **Future&lt;T?&gt;** | `drainErrorsAll()`                 | `Future<T?>` | Return null on error for any Future type                 |
| **Future&lt;T?&gt;** | `drainErrorsNullable()`            | `Future<T?>` | Return null on error for nullable Futures                |
| **Future&lt;T?&gt;** | `unwrapWith()`                     | `Future<T>`  | Unwrap nullable futures with alternative values          |
| **Stream&lt;T&gt;**  | `bufferedStreamUntilFirstListener` | `Stream<T>`  | Buffer events until first listener subscribes            |
| **Stream&lt;T&gt;**  | `onErrorFinishWith()`              | `Stream<T>`  | Complete stream on first error with optional final value |
| **Stream&lt;T&gt;**  | `takeFor()`                        | `Stream<T>`  | Take events for a specified duration                     |
| **Stream&lt;T&gt;**  | `withTimeoutBetweenEvents()`       | `Stream<T>`  | Add timeout detection between stream events              |
| **Stream&lt;T?&gt;** | `unwrap()`                         | `Stream<T>`  | Filter out null values from streams                      |

### Base Types

| Extension on | Method/Property     | Returns         | Description                                        |
| ------------ | ------------------- | --------------- | -------------------------------------------------- |
| **Color**    | `avg()`             | `Color`         | Get average color between two colors               |
| **Color**    | `darken()`          | `Color`         | Darken a color by percentage                       |
| **Color**    | `lighten()`         | `Color`         | Lighten a color by percentage                      |
| **DateTime** | `addDays()`         | `DateTime`      | Add days to a date                                 |
| **DateTime** | `addHours()`        | `DateTime`      | Add hours to a date                                |
| **DateTime** | `addMonths()`       | `DateTime`      | Add months to a date                               |
| **DateTime** | `addYears()`        | `DateTime`      | Add years to a date                                |
| **DateTime** | `firstDayOfMonth`   | `DateTime`      | Get first day of the month                         |
| **DateTime** | `isFirstDayOfMonth` | `bool`          | Check if date is first day of month                |
| **DateTime** | `isLastDayOfMonth`  | `bool`          | Check if date is last day of month                 |
| **DateTime** | `isSameDay()`       | `bool`          | Check if two dates are the same day                |
| **DateTime** | `isSameMonth()`     | `bool`          | Check if two dates are in the same month           |
| **DateTime** | `isSameWeek()`      | `bool`          | Check if two dates are in the same week            |
| **DateTime** | `isToday`           | `bool`          | Check if date is today                             |
| **DateTime** | `isTodayOrBefore`   | `bool`          | Check if date is today or before                   |
| **DateTime** | `isTomorrow`        | `bool`          | Check if date is tomorrow                          |
| **DateTime** | `isYesterday`       | `bool`          | Check if date is yesterday                         |
| **DateTime** | `lastDayOfMonth`    | `DateTime`      | Get last day of the month                          |
| **DateTime** | `nextDay`           | `DateTime`      | Get next day                                       |
| **DateTime** | `nextHour`          | `DateTime`      | Get next hour                                      |
| **DateTime** | `nextMonth`         | `DateTime`      | Get next month                                     |
| **DateTime** | `nextWeek`          | `DateTime`      | Get next week                                      |
| **DateTime** | `nextYear`          | `DateTime`      | Get next year                                      |
| **DateTime** | `previousDay`       | `DateTime`      | Get previous day                                   |
| **DateTime** | `previousHour`      | `DateTime`      | Get previous hour                                  |
| **DateTime** | `previousMonth`     | `DateTime`      | Get previous month                                 |
| **DateTime** | `previousWeek`      | `DateTime`      | Get previous week                                  |
| **DateTime** | `previousYear`      | `DateTime`      | Get previous year                                  |
| **int**      | `days`              | `Duration`      | Convert integer to Duration in days                |
| **int**      | `hours`             | `Duration`      | Convert integer to Duration in hours               |
| **int**      | `millis`            | `Duration`      | Convert integer to Duration in milliseconds        |
| **int**      | `minutes`           | `Duration`      | Convert integer to Duration in minutes             |
| **int**      | `rangeTo()`         | `Iterable<int>` | Generate iterable range between two integers       |
| **int**      | `seconds`           | `Duration`      | Convert integer to Duration in seconds             |
| **num**      | `isDouble`          | `bool`          | Check if number is a double                        |
| **num**      | `isInteger`         | `bool`          | Check if number is an integer                      |
| **num**      | `isNegative`        | `bool`          | Check if number is negative                        |
| **num**      | `isNegativeOrZero`  | `bool`          | Check if number is negative or zero                |
| **num**      | `isPositive`        | `bool`          | Check if number is positive                        |
| **num**      | `isPositiveOrZero`  | `bool`          | Check if number is positive or zero                |
| **num**      | `isZero`            | `bool`          | Check if number is zero                            |
| **String**   | `hardcoded`         | `String`        | Mark string as hardcoded for localization tracking |
| **String?**  | `capitalized`       | `String`        | Capitalize first letter, lowercase rest            |
| **String?**  | `getReadTime()`     | `int`           | Estimate read time in minutes                      |
| **String?**  | `hasMatch()`        | `bool`          | Check if string matches regex pattern              |
| **String?**  | `isAlphabetOnly()`  | `bool`          | Check if string contains only letters              |
| **String?**  | `isBlank`           | `bool`          | Check if string is null, empty, or whitespace      |
| **String?**  | `isBool()`          | `bool`          | Check if string is 'true' or 'false'               |
| **String?**  | `isNumericOnly()`   | `bool`          | Check if string contains only numbers              |
| **String?**  | `onlyLatin`         | `String`        | Remove non-Latin characters                        |
| **String?**  | `reversed`          | `String?`       | Reverse the string                                 |
| **String?**  | `wordCount`         | `int`           | Count words in string                              |

### Iterables

| Extension on          | Method/Property                | Returns               | Description                        |
| --------------------- | ------------------------------ | --------------------- | ---------------------------------- |
| **Iterable&lt;T&gt;** | `addAllByAvoidingDuplicates()` | `Iterable<T>`         | Add items avoiding duplicates      |
| **Iterable&lt;T&gt;** | `containsDuplicates`           | `bool`                | Check if iterable has duplicates   |
| **Iterable&lt;T&gt;** | `duplicates`                   | `Iterable<T>`         | Get only duplicate elements        |
| **Iterable&lt;T&gt;** | `flatten()`                    | `Iterable<T>`         | Flatten nested iterable structures |
| **Iterable&lt;T&gt;** | `groupBy()`                    | `Map<K, Iterable<T>>` | Group elements by a key function   |
| **Iterable&lt;T&gt;** | `mapList()`                    | `List<E>`             | Map iterable to list in one step   |
| **Iterable&lt;T&gt;** | `mapWithIndex()`               | `Iterable<E>`         | Map with index information         |
| **Iterable&lt;T&gt;** | `numberOfDuplicates`           | `int`                 | Count duplicate elements           |
| **Iterable&lt;T&gt;** | `operator +`                   | `Iterable<T>`         | Append single element              |
| **Iterable&lt;T&gt;** | `operator -`                   | `Iterable<T>`         | Remove element from iterable       |
| **Iterable&lt;T&gt;** | `uniques`                      | `Iterable<T>`         | Get only unique elements           |
| **Iterable&lt;T&gt;** | `without()`                    | `Iterable<T>`         | Remove specific element            |
| **Iterable&lt;T&gt;** | `withoutIterable()`            | `Iterable<T>`         | Remove multiple elements           |

### Lists

| Extension on                  | Method/Property                | Returns       | Description                              |
| ----------------------------- | ------------------------------ | ------------- | ---------------------------------------- |
| **List&lt;T&gt;**             | `addAllByAvoidingDuplicates()` | `void`        | Add items avoiding duplicates (in-place) |
| **List&lt;T&gt;**             | `compactMap()`                 | `List<E>`     | Map and filter out null values           |
| **List&lt;T&gt;**             | `containsDuplicates`           | `bool`        | Check if list has duplicates             |
| **List&lt;T&gt;**             | `duplicates`                   | `List<T>`     | Get duplicate elements                   |
| **List&lt;T&gt;**             | `isEqualTo()`                  | `bool`        | Compare lists for ordered equality       |
| **List&lt;T&gt;**             | `isEqualToUnordered()`         | `bool`        | Compare lists ignoring order             |
| **List&lt;T&gt;**             | `merge()`                      | `List<T>`     | Merge lists with optional uniqueness     |
| **List&lt;T&gt;**             | `numberOfDuplicates`           | `int`         | Count duplicate elements                 |
| **List&lt;T&gt;**             | `removeDuplicates()`           | `void`        | Remove duplicates in-place               |
| **List&lt;T&gt;**             | `splice()`                     | `Iterable<T>` | Remove and insert elements at positions  |
| **List&lt;T&gt;**             | `toMap()`                      | `Map<T, E>`   | Convert list to map with value mapping   |
| **List&lt;T&gt;**             | `uniques`                      | `List<T>`     | Get only unique elements                 |
| **List&lt;T extends num&gt;** | `divided`                      | `T`           | Divide first element by rest             |
| **List&lt;T extends num&gt;** | `max`                          | `T`           | Get maximum value                        |
| **List&lt;T extends num&gt;** | `min`                          | `T`           | Get minimum value                        |
| **List&lt;T extends num&gt;** | `multiplied`                   | `T`           | Multiply all elements together           |
| **List&lt;T extends num&gt;** | `subtractOthersFromFirst`      | `T`           | Subtract rest from first element         |
| **List&lt;T extends num&gt;** | `sum`                          | `T`           | Sum all elements                         |
| **List&lt;T?&gt;**            | `whenAll()`                    | `T?`          | Execute callback when all non-null       |
| **List&lt;T?&gt;?**           | `unwrap()`                     | `List<T>`     | Unwrap nullable lists and filter nulls   |

### Maps

| Extension on                   | Method/Property              | Returns                    | Description                            |
| ------------------------------ | ---------------------------- | -------------------------- | -------------------------------------- |
| **Map&lt;K, V&gt;**            | `filter()`                   | `Iterable<MapEntry<K, V>>` | Filter map entries with predicates     |
| **Map&lt;K, V&gt;**            | `isEqualTo()`                | `bool`                     | Compare maps ignoring entry order      |
| **Map&lt;K, V&gt;**            | `mappedKeys()`               | `Map<R, V>`                | Map keys to new values                 |
| **Map&lt;K, V&gt;**            | `mappedValues()`             | `Map<K, R>`                | Map values to new values               |
| **Map&lt;K, V&gt;**            | `merge()`                    | `Map<K, V>`                | Merge maps with value overwriting      |
| **Map&lt;K, V&gt;**            | `operator +`                 | `Map<K, V>`                | Add maps together                      |
| **Map&lt;K, V&gt;**            | `search()`                   | `Iterable<MapEntry<K, T>>` | Recursively search nested maps by type |
| **Map&lt;K, V&gt;**            | `where()`                    | `Map<K, V>`                | Filter by keys and values              |
| **Map&lt;K, V&gt;**            | `whereKey()`                 | `Map<K, V>`                | Filter by keys only                    |
| **Map&lt;K, V&gt;**            | `whereValue()`               | `Map<K, V>`                | Filter by values only                  |
| **Map&lt;String, dynamic&gt;** | `mergeNested()`              | `Map<String, dynamic>`     | Deeply merge nested maps               |
| **Map&lt;String, dynamic&gt;** | `mergeNestedWithAdditions()` | `Map<String, dynamic>`     | Merge with numerical additions         |

### Misc

| Extension on     | Method/Property           | Returns                 | Description                     |
| ---------------- | ------------------------- | ----------------------- | ------------------------------- |
| **BuildContext** | `appBarTheme`             | `AppBarThemeData`       | Get AppBar theme data           |
| **BuildContext** | `backgroundColor`         | `Color`                 | Get background color            |
| **BuildContext** | `bottomAppBarTheme`       | `BottomAppBarThemeData` | Get bottom app bar theme        |
| **BuildContext** | `bottomSheetTheme`        | `BottomSheetThemeData`  | Get bottom sheet theme          |
| **BuildContext** | `canPop()`                | `bool`                  | Check if can pop route          |
| **BuildContext** | `colorScheme`             | `ColorScheme`           | Get color scheme                |
| **BuildContext** | `dividerColor`            | `Color`                 | Get divider color               |
| **BuildContext** | `focusColor`              | `Color`                 | Get focus color                 |
| **BuildContext** | `hoverColor`              | `Color`                 | Get hover color                 |
| **BuildContext** | `maybePop()`              | `Future<bool>`          | Try to pop route                |
| **BuildContext** | `navigator`               | `NavigatorState`        | Get NavigatorState              |
| **BuildContext** | `pop()`                   | `void`                  | Pop current route               |
| **BuildContext** | `popUntil()`              | `void`                  | Pop until route name            |
| **BuildContext** | `primaryColor`            | `Color`                 | Get primary color               |
| **BuildContext** | `primaryColorDark`        | `Color`                 | Get dark primary color          |
| **BuildContext** | `primaryColorLight`       | `Color`                 | Get light primary color         |
| **BuildContext** | `primaryTextTheme`        | `TextTheme`             | Get primary text theme          |
| **BuildContext** | `push()`                  | `Future<T?>`            | Push new route                  |
| **BuildContext** | `pushAndRemoveUntil()`    | `Future<T?>`            | Push and remove until predicate |
| **BuildContext** | `pushNamed()`             | `Future<T?>`            | Push named route                |
| **BuildContext** | `pushReplacement()`       | `Future<T?>`            | Push replacement route          |
| **BuildContext** | `pushReplacementNamed()`  | `Future<T?>`            | Push named replacement route    |
| **BuildContext** | `scaffoldBackgroundColor` | `Color`                 | Get scaffold background color   |
| **BuildContext** | `textTheme`               | `TextTheme`             | Get text theme                  |
| **BuildContext** | `theme`                   | `ThemeData`             | Get theme data                  |

### Object

| Extension on | Method/Property | Returns     | Description                               |
| ------------ | --------------- | ----------- | ----------------------------------------- |
| **T**        | `toFuture()`    | `Future<T>` | Convert any value to Future with delay    |
| **T?**       | `flatMap()`     | `E?`        | Transform nullable objects safely         |
| **T?**       | `mapIfOfType()` | `R?`        | Apply function if object is specific type |
| **T?**       | `orDefault`     | `T`         | Get default value for null objects        |

### Widget

| Extension on | Method/Property | Returns | Description                              |
| ------------ | --------------- | ------- | ---------------------------------------- |
| **Widget**   | `asToast()`     | `void`  | Display widget as temporary toast dialog |

## Note

PRs are welcome in case you wish to broaden the list of extensions, but it must include proper documentation and tests.

## License

```
Copyright 2025 Norbert Csörgő

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
