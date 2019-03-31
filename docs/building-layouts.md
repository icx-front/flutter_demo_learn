# Building Layouts

What's the point?
- Widgets are classes used to build UIs.
- Widgets are used for both layout and UI elements.
- Compose simple widgets to build complex widgets.

Flutter布局的核心在于控件。Flutter中，几乎所有都是控件，包括布局模型。还有一些不可见元素，比如
rows, columns和grids。

## 水平垂直多控件布局
What's the point?
- Row and Column are two of the most commonly used layout patterns.
- Row and Column each take a child widget.
- A child widget can itself be a Row, Column, other complex widget.
- You can specify how a Row or Column aligns its children, both vertically and horizontally.
- You can stretch or constrain child widgets.
- You can specify how child widgets use the Row's or Column's available space.

## 交互
What you'll learn
- How to response to taps
- How to create custom widget
- The difference between stateless and stateful widget

## 状态管理
What's the point?
- There are different approaches for managing state.
- You, as the designer, choose which approach to use.
- If in doubt, start by managing state in the parent.

谁管理状态控件的状态？是控件本身还是父级控件呢？还是都管理其状态呢？这得看情况。状态管理一般有一下几种：
1. 自理
2. 它理
3. 混合双打

我们可以根据一下规则来决定使用哪一种方式来管理状态控件的状态：
- 如果是用户数据，例如复选框是否选中，slider位置，类似这些最好是由父级管理。
- 其他如动画之类的可以有控件自身管理。


## Adding assets and images
特别的，需要在`pubspec.yaml`中声明需要用的`assets`：








