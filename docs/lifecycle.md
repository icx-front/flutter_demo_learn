# Step Over Flutter Demo

## 添加一个状态控件
无状态控件都是不可变的，这就意味着它的属性是不可变的，所有的值都是final的。

状态控件维持了控件生命周期中的可能状态，实现一个状态控件至少需要两个类，
1. 一个StatefulWidget类：用来状态控件实例。
2. a State 类

其中StatefulWidget本身是不可变的，而实例化出的状态类在控件生命周期中是保持不变的。

## 状态控件的生命周期
当Flutter build一个状态控件时，它创建了一个`State`对象，这个对象包含了控件的，
所有可变属性。

state的两个概念：
1. 控件利用数据可能会变化，
2. 数据在控件构建时，不能同步对读取到。

The lifecycle has the following simplified steps:

- createState()
- mounted == true
- initState()
- didChangeDependencies()
- build()
- didUpdateWidget()
- setState()
- deactivate()
- dispose()
- mounted == false

为什么需要StatefulWidget和State类呢？

简单来说：性能问题。

State对象是持久化的，但是StatefulWidget(all Widget)都会在rebuild过程被丢弃，
而对Flutter而言， rebuild一个可变控件是廉价的。

真因为State的持久化，从而避免了耗费性能的一些计算。

### 1. createState()
当需要构建一个`StatefulWidget`时，它最先调用的是必须存在的`createState`方法。通常而言，
状态控件也就实现了这个方法，一般不会有更大的复杂度。

```dart
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
```

### 2. mounted is true

当`createState`创建了state类时，并赋值给了`buildContext`。
所有的控件都有一个属性`this.mounted`。当`buildContext`被赋值时，
这个值就赋值为`true`了。

### 3. initState()


### 4. didChangeDependencies()
`didChangeDependencies`会在`initState`调用后立即执行，不同于`initState`,
它还会在控件依赖的数据变化时被调用。

`build`总是会在`didChangeDependencies`后被调用，所以它不是那么需要实现的方法。

文档建议，如果你需要网络请求（其他费时费力的操作）时，这个方法就非常有作用了。

### 5. build
这个方法经常被调用，同时它也是必须的，且必须返回一个控件，记住，在Flutter中，
所有的GUI都是widget。

### 6. didUpdateWidget(Widget oldWidget)
这个方法会在父级控件更新，并且当前控件需要rebuild时被调用。Fluter总会在这个方法后
调用`build`，所以这之后的`setState`是没有多余的。

### 7. setState()
框架本身和开发者，会常调用`setState`方法，它是用来通知框架"依赖性数据"有更新啦，对应的
widget需要重建，`buildContext`需要重新赋值啦。

`setState`接受一个同步的回调函数。

### 8. deactivate()
这个很少用。

### 9. dispose()
这个用的也不多，多用于取消订阅，取消动画，流等。

### 10. mounted is false



