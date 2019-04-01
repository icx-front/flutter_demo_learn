# Fetch data from the internet

## Directions
1. Add the `http` package
2. Make a network request using the `http` package
3. Convert the response into a custom Dart object
4. Fetch and Display the data with Flutter

## Add the `http` package
生命依赖：

```yaml
dependecies:
    http: <latest_version>
```

## Make a network request
Dart中异步，在Dart核心类中表现为`Future`，跟Javascript中的`Promise`有几分类似:

```dart
Future<http.Response> fetchPost() {
  return http.get('uri');
}
```

## Convert the response into a custom Dart object
直接使用原生的`Future<http.Response>`对象可能不是那么简便，所以通常的做法是，将其转化为Dart对象。

## Fetch and Display the data
为了展现异步的数据，我们可以使用`FutrueBulder`控件。通过它，我们可以更容易的处理异步资源。

```dart
FutureBuild<Post>(
  future: fetchPost(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snaphot.data.title);
    } else if(snaphost.hasError) {
      return Text("${snaphot.error}");
    }
  }
);
```
## Moving the fetch call out of the `build()` method
直接在`build`方法中调用异步方法很方便，但是却不是推荐的做法，因为`build`在view的任何变化中都会被频繁调用，
我们可以参考以下的实现：

### 做为数据传递给无状态控件
这种形式下，父级控件负责调用API，然后传值给渲染控件：

```dart
class MyApp extends StatelessWidget {
  final Future<Post> post;
  
  MyApp({Key key, this.post}) : super(key: key);
}
```

### 状态组件的生命周期函数中调用
假如你的控件是有自状态的，你可以在`initState`和`didChangeDependencies`中调用API，其中`initState`会且仅会
调用一次。其他更多参考[State](https://api.flutter.dev//flutter/widgets/State-class.html)。

```dart
class _MyAppState extends State<MyApp> {
  Future<Post> post;
  
  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }
}
```
## 测试
测试在TDD中至关重要，但是国内实践不多，更多的参考文档：

- [单元测试](https://flutter.dev/docs/cookbook/testing/unit/introduction)
- [Mock](https://flutter.dev/docs/cookbook/testing/unit/mocking)

