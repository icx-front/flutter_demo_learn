# Step Over Flutter Demo

## 添加一个状态控件
无状态控件都是不可变的，这就意味着它的属性是不可变的，所有的值都是final的。

状态控件维持了控件生命周期中的可能状态，实现一个状态控件至少需要两个类，
1. 一个StatefulWidget类：用来状态控件实例。
2. a State 类

其中StatefulWidget本身是不可变的，而实例化出的状态类在控件生命周期中是保持不变的。

