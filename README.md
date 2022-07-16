# Wonbi's Study!

# 2022.7.15 (금)

## UIStackView
- 열 또는 행에 뷰 들의 묶음을 배치할 수 있는 간소화된 인터페이스
- 복잡한 UI를 구성할 때 일일이 AutoLayout을 이용해 제약조건을 걸어주게 되면 제약조건이 많아져 복잡해져 제대로 구성이 안될 수 도 있고, 유지보수나 수정이 더 어려워지는 문제가 있다. 이럴 때 사용하는 것이 바로 이 UIStackView이다.
- Vertical Stack View와 Horizontal Stack View를 적절히 사용하여 라벨을 묶어주면 복잡한 제약조건 없이 구성이 가능해진다


## UIStackView의 속성
- 스토리보드에서 스택 뷰를 선택하고 속성 인스펙터를 보면 다양한 속성을 설정할 수 있다.
- 스택 뷰는 스택 뷰 안에 있는 서브 뷰들의 포지션, 사이즈를 맞추기 위해 속성을 설정해주면 된다.
- Axis, Alignment, Distribution, Spacing 네가지의 속성들이 있다.

### Axis
- Vertical Stack View와 Horizontal Stack View를 결정하는 속성으로 스택 뷰의 뱡향을 결정한다.
- Vertical Stack View로 설정하면, 서브 뷰들이 세로 방향으로 추가가 된다. (책을 쌓는 느낌)
- Horizontal Stack View로 설정하면, 서브 뷰들이 가로 방향으로 추가가 된다. (책꽂이에 책을 꽂는 느낌)

### Distribution
- 스택 뷰 안에 들어있는 서브 뷰들의 사이즈를 어떻게 분배해야 하는지 결정한다.
- 스택 뷰의 Axis 옵션에 따라 가로 혹은 세로의 크기를 결정한다.
    1. Fill : 가능한 공간을 모드 채우기 위해 서브 뷰 사이즈를 재조정 한다. 서브 뷰들이 스택 뷰 보다 작거나 크면, 각 뷰들의 우선순위에 따라 줄이거나 늘려서 스택 뷰를 다 채우게 만든다.
    2. Fill Equally : 말그대로 서브 뷰들을 같은 크기로 재조정하여 스택 뷰를 채운다.
    3. Fill Proportionally : 서브 뷰가 가지고 있는 크기에 비례하여 스택 뷰를 채운다. 기존 크기의 비율을 유지한 채 조정된다 보면 된다.
    4. Equal Spacing : Fill Equally와 반대로, 각 뷰 사이의 간격을 균등하게 분배한다.
    5. Equal Centering : 각 서브 뷰의 중간 지점을 기준으로 동일한 간격으로 분배한다.

### Aligment
- 스택 뷰의 서브 뷰들을 어떤식으로 정렬할 지 결정한다.
    1. Fill : 스택 뷰의 Axis값이 Horizontal 일 경우, 아래 위 공간을 채우기 위해 스택 뷰의 크기까지 늘려준다. 반대로 Vertical일 경우 좌우의 공간을 채우기 위해 스택 뷰의 크기까지 좌우로 늘려준다.
    2. Leading : Vertical일 경우에 사용하는 옵션으로 서브 뷰들이 왼쪽에 맞춰 정렬이 된다.
    3. Top : Horizontal일 경우에 사용하는 옵션으로 서브 뷰들이 위쪽에 맞춰 정렬이 된다.
    4. Trailing : Vertical일 경우에 사용하는 옵션으로 서브 뷰둘이 오른쪽 정렬이 된다.
    5. Bottom : Horizontal일 경우에 사용하는 옵션으로 서브 뷰들이 아래쪽에 맞춰 정렬이 된다.
    6. Center : Axis의 값에 따라 서브 뷰가 중앙 정렬이 된다.
    7. First Baseline : Horizontal일 경우에만 사용하는 옵션으로 서브 뷰들 내부의 텍스트 첫번째 줄에 맞춰 정렬이 된다.
    8. Last Baseline : Horizontal일 경우에만 사용하는 옵션으로 서브 뷰들 내부의 텍스트 마지막 줄에 맞춰 정렬이 된다.

### Spacing
- 스택 뷰 내부 서브 뷰들의 간격을 조절하는 옵션이다.

## 계산기 만들기 실습

### 문제점
- 이번 강의에서는 강의 내 스위프트 버전과 내 스위프트 버전이 달라서 여러가지 애로사항들이 많았다.
    1. 강의 그대로 따라 제약조건을 설정하고 했는데 결과물이 이상하게 나왔다.
         - 특히 AC 버튼과 0 버튼을 구현할 때 레이아웃이 꼬이는 문제가 계속 있었다. 원인은 모르겠고.. 호리즌 스택 뷰 안에 어거지로 다시 호리즌 스택 뷰를 만들어 해결하긴 했다.
    2. IBDesignable 문제
        - iOS 15가 발표되면서, UIButton Style의 변화가 있었는데, 스타일의 기본 값이 Plain으로 바뀐 것이다. 이전 버전이 호환되게 어플을 만드려면, 이 값을 Default로 바꿔줘야 한다.
        - 참고(https://mini-min-dev.tistory.com/43)

### 디밸롭하기
- 계산기 앱인데, 숫자가 세자리마다 콤마가 안찍히는 계산기였다! 심지어 0을 계속 누르면 0000... 이렇게 계속 나오는.. 되다만 계산기였다. 이 강의의 질이 별로 높지 않을거 같다는 생각이 갑자기 들었다.. 
    1. 0은 한번만!
        - 이 문제는 매우 간단하게 해결했다. 다음 한줄을 추가 해줌으로써 해결했다.
        ```Swift
        if numberOutputLabel.text == "0" && sender.currentTitle == "0" { return }
        // 현재 표시되고 있는 숫자(numberOutputLabel.text)가 0이고, 터치한 숫자(sender.currentTitle)가 0이면 메소드를 return한다.
        ```
    2. 세자리 콤마 넣기
        - NumberFormmatter라는 기능을 알게 되었다. 참고(https://jeong9216.tistory.com/104)
        - 이 기능을 이용해서 꼭 세자리 콤마 찍기를 구현해야겠다고 생각했다.~~(아직 못했음)~~
        

# 2022.7.16

## 세자리 콤마 및 소수점 해결하기

### 세자리 콤마 넣기
- `tapNumberButton`메소드 안에서 이 문제를 한번에 해결하기에는 적절하지 못하다 판단하여 세자리 콤마를 넣어주는 메소드를 따로 구현해봤다.
- 문제는 소수점 밑으로는 콤마가 들어가선 안되고, 그 전까진 콤마가 들어가는 것이 유지되어 있어야 한다는 점이다.
- 다음과 같은 방법으로 해결해보았다.
    1. 일단 소수점이 있는 경우와 없는 경우를 구분한다.
    2. 소수점이 있을 경우, `components`라는 `String`타입의 메소드를 활용하여 앞부분과 뒷부분을 구분해서 앞부분은 `numberFormatter.string`메소드를 활용해서 세자리마다 콤마가 들어가게 해준다.
    3. 그리고 소수점 이후 숫자들은 그대로 사용한다.
    4. 그다음 세자리 콤마가 포함된 글자와 소수점, 소수점 뒷부분 숫자를 합친 값을 아웃풋 라벨에 대입한다.
    5. 소수점이 없을 경우, `numberFormatter.string`메소드를 이용해서 세자리마다 콤마가 들어가게 해준 뒤 바로 아웃풋 라벨에 대입한다.
- 코드로 보면 다음과 같다.
```Swift
    func formattingToDecimal(num: String) {
        numberFormatter.numberStyle = .decimal
        //숫자의 스타일을 세자리마다 콤마가 들어가게 바꿔주는 스타일로 바꿈
        if displayNumber.contains(".") {
            guard let naturalNumber = numberFormatter.string(for: Int(displayNumber.components(separatedBy: ".")[0]) ?? 0) else { return }
            numberOutputLabel.text = naturalNumber + "." + num.components(separatedBy: ".")[1]
        } else {
            numberOutputLabel.text = numberFormatter.string(for: Int(displayNumber) ?? 0)
        }
    }
```
