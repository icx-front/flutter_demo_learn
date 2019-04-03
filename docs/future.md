# Asynchronous Programming: Futures

What's the point?
- Dart core runs in a single "thread" of execution.
- Code that blocks the thread of execution can make program freeze.
- Future object(futures) represent the results of asynchronous operations -- processing or I/O to
  be completed later.
- To suspend execution until a future completes, use `await` in an async function.
- To catch errors, use try-catch expressions in async function.
- To run code concurrently, create an isolate.

## What's Future?
future是`Future<T>`对象，它表示一种异步操作，且它结果类型是`T`， 如果它没有返回值，则其中的返回类型为`void`，
如果它具有返回值，则有一下两种情况：
1. 函数进入执行队列以待执行，并返回一个未完成的`Future`队形，
2. 当操作完成时，`Future`返回一个值或者错误。

可以使用两种不同的形式使用`Future`：
- `async`和`await`，以同步的方式写异步，
- 使用`Future` API

## Async and await

![调用栈](https://www.dartlang.org/tutorials/images/async-await.png)