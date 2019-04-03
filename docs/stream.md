# Asynchronous Programming: Streams

What's the point?
- Streams provide an asynchronous sequence of data.
- Data sequence include user-generated events and data from files.
- You can process a stream using either **await for** or `listen()` from the stream API.
- Streams provide a way to respond to errors
- There are two kinds of streams: single subscription or broadcast.

Dart中与异步相关的有两个类：`Future`和`Stream`。

其中代表不会立即完成的计算，其中普通的函数返回的是一个值，而异步函数则是返回一个F，F完成时，会告诉你这个结果值。
而S不同，它是一系列异步事件，可以想象成异步遍历。

## 接受流事件
流可以通过多种方式创建，但是它可以通过一致的方式消费：**await fot**. 这个跟遍历一个可遍历对象非常类似：

```dart
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}
```
通过`async*`方式，新建个简单的stream:

```dart
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}
```

消费：

```dart
main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}
```

## 错误事件

当流中没有更多的事件时，流就完成了。这个时候就接受事件方就更普通的事件一般，接受到'完成'时间的通知，
当使用**await for**，当流完成时，循环就停止了。

在一些场景中，在流结束前，可能发生一些错误，同样我们可以通过`try..catch`的方式捕获。

```dart
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (var value in stream) {
      sum += value;
    }
  } catch(e) {
    return -1;
  }
  return sum;
}
```
