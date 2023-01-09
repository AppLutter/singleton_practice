Singleton 디자인 패턴은
객체를 어디서 호출하든지 하나의 인스턴스만 사용할 때 쓰는 패턴입니다.

인스턴스 만드는데 비용이 많이 들 때 유용하다.






class ExampleState extends ExampleStateBase {
    static final ExampleState _instance = ExampleState._internal();

    factory ExampleState() {
        return _instance;
    }

    ExampleState._internal() {
    initialText = "A new 'ExampleState' instance has been created.";
    stateText = initialText;
    }
}


인스턴스가 만들어지지 않았을 때
1. ExampleState 생성자 호출
factory ExampleState() {
   return _instance;
   }

2. 인스턴스에 값 배정
static final ExampleState _instance = ExampleState._internal();

3. ExampleState._internal() 함수 실행


인스턴스가 한 번이라도 만들어진 이후
1. ExampleState 생성자 호출 끝