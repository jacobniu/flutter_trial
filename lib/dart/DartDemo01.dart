///一，一个简单的Dart程序
// 定义一个函数
printInteger(int aNumber) {
  print(aNumber);
}

// 应用程序从这里开始执行
main() {
  var number = 22; // 声明并初始化一个变量
  printInteger(number);
}

/// 二，重要的概念
// 1，任何保存在变量中的都是一个继承自[Object]的对象
// 2，支持类型推断
// 3，支持泛型如[List<int>](整形列表)或者[List<dynamic>](任何类型的对象列表)
// 4，支持函数或者变量定义在顶层
// 5，以"_"开头则表示它相对于库时私有的
// 6，包含表达式(有运行时值)和语句(没有运行时值)
// 7，Dart工具提示两类问题，警告和错误。

/// 三，定义变量
// 1，不明确指定类型
var name1 = 'Jack';
// 2，指定为动态类型
dynamic name2 = 'Jack';
// 3，明确指定为字符串类型
String name3 = 'Jack';

// 没有初始化的变量的默认值都是null，即便是数字类型也一样
int age;
String name4;
// 使用过程中从来不会被修改的变量可以使用final或者const修饰
// const变量在编译时就已经固定了，const变量时隐式的final类型。
final name5 = 'Bob';
final String name6 = 'Jack';
const bar = 100000;

/// 四，内建类型