
void main(){
//  tt();
//  tt1();
//    tt2();
//    tt3();
    tt4();
//    tt5();
}

void tt(){
  ///语法跟java 类似
  //声明类型
  String name = "jack";
  //自动判断类型
  dynamic t = 5;
  //不声明类型
  var a = 5;
  //常量
  const b = 6;

  //默认值
//  未初始化的变量的初始值为null（包括数字），因此数字、字符串都可以调用各种方法。
  var d ;
  int e;
  String f;
  dynamic g;
  print("\n");
  print(d);
  print(e);
  print(f);
  print(g);

}

class User {
  static final a = 1;
  static const b = 2;
}

void tt1(){
  ///Final 和 Const的用法
  //final  const是不可更改的常量  ,如果是类里面的常量要用static 修饰
  final int  a = 9;
  final int b = 7;
  final c = false;
  const d = 7;
  const String e = "jack";


  ///单引号和双引号
  const ttt = "双引号里面有双引号，\"hello world\"";
  print(ttt);
  print("双引号里面有双引号，\"hello world\"");
  print("双引号里面有单引号hello''_''world");

  String connectionStr = """这是用双引号创建的
  多行字符串。""";
  print(connectionStr);
  var con = "ddddd"+"cccccc";
  print(con);
  print("""jslajlfjldjglsjgljl""");
  print("""""");

  ///关于转义符号的使用
  //声明raw字符串（前缀为r），在字符串前加字符r，或者在\前面再加一个\，
  //可以避免“\”的转义作用，在正则表达式里特别有用。
  print(r"换行符: \n"); //打印结果换行符: \n
  print("换行符 \\n");//打印结果换行符 \n
  print("换行符\n"); //换行符
  print("\n换行符"); //  空一行  换行符

  print("${a.bitLength} ,$b,$e");

  ///类里面的常量 最好使用static 修饰
  ///见user里面
}

///集合
void tt2(){
  ///list 第一种创建方式
  List<String> list = new List();
  list.add("t1");
  list.add("t2");
  list.remove("t2");
  print(list);  //[t1]

  ///list 第二种创建方式 ,常量集合不可操作修改
  List list1 = const [1,2,3,4,5];
//  list1.add("jack");
  print(list1); //[1, 2, 3, 4, 5]

  List list2 = [1,2,3,4];
  list2.add("jack");
  print(list2); //[1, 2, 3, 4, jack]

  List list3 = [];
  print(list3);  //[]
}

///map
void tt3(){
  Map map = Map();
  print(map);
  var map1 = Map();
  print(map1);
  var map3 = {"1":"jack","2":3};
  print(map3);
}

void tt4(){
  ///（一）?.像.一样，但最左边的操作数可以为空。
  print(Test.funs);
  print(Test?.funs);

  ///..级联符号..
  var ss = StringBuffer()
  ..write("jack")
  ..write("shenzhen")
  ..write("hubei");
  print(ss);

  ///?? 三目运算符的一种形式。expr1 ?? expr2 表示如果expr1非空，则返回其值; 否则返回expr2的值
  //普通三元运算符
  int a = 10;
  var values = a > 5 ? a : 0;
//??操作符
  print('a ??=3 : ${a ??= 3}');  // 3
  String aa ;
  print(" ++++  ++++ ${aa ?? "jack"}");
//打印结果  ++++  ++++ jack

  ///（四）~/ 除法，返回一个整数结果
  var result2 = 5/2;
  print(result2);//结果是：2.5
  var result3 = 5~/2;
  print(result3);//结果是：2

  ///（五）as、is与is!
  var age = 5;
  var name = "jack";
  var na = "nana";
  if(age is String){
    print("as 是 String");
  }else{
    print("as 不是String");
  }

  switch(1){
    case 1:
      print("111111");
      break;
//      continue 5;
//     case 5:
//      print("shared");
//      break;
    case 2:
      break;
    case 3:
      break;
  }
}

void tt5(){
  try {
    // A specific exception
    print("try");
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }finally{
    print("finally");
  }

}



class Test {
  static int funs = 5;

  Test() {
    print('构造函数 Test');
  }
  static fun() {
    print('Test fun函数');
  }
}





