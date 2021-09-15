# 📜 만국 박람회(Exposition)

🗓 프로젝트 진행 기간 : 2021-04-05 ~ 2021.04.16

### Index

- [Overview](#Overview)
- [기능](#기능)
- [설계 및 구현](#설계-및-구현)
- [고민했던 점](#고민했던-점)
- [Trouble Shooting](#Trouble Shooting)

<br>

## 1. Overview

Json 파일 내의 Exposition 정보를 Scroll View와 Table View에 출력하는 App

해당 앱은 iPhone 전용이며, 첫 화면의 경우 가로모드를 지원하지 않습니다

모든 화면에서 Dynamic Type을 적용하여 사용자의 Font Size 설정에 따른 Text 크기 변화를 지원합니다



### MVC

JSON Parsing을 하기 위해 데이터와 매칭되는 `Model`, Parsing된 데이터를 나타내는 `View`, 두 요소를 이어주며 User의 interaction에 반응하는 ViewController가 단순한 구조를 가지고 있기에 MVC 아키텍처를 채택했습니다

<img width="640" alt="스크린샷 2021-09-15 오후 8 01 58" src="https://user-images.githubusercontent.com/64566207/133422170-b3566560-6ae8-4c91-8346-962e69ee20e0.png">

<br>

### Storyboard를 통한 UI 구성

AutoLayout에 대하여 제대로 처음 학습하는 단계이기에, 가시성을 장점으로 가지고 있는 Storyboard 방식을 통해 UI를 구성했습니다. iPhone 전 기기에 대응할 수 있도록 AutoLayout을 설정했으며, ScrollView를 통하여 Layout 요소들을 탐색할 수 있습니다

<p float="left">
  <img src="https://user-images.githubusercontent.com/64566207/133422959-3cc0d640-5758-46cb-845a-bb9ceb0ba2b8.png" height="400">
  <img src="https://user-images.githubusercontent.com/64566207/133422965-2a7e90e9-2bc6-4f01-907d-36512e057f71.png" height="400">
</p>

  <br>

## 2. 기능

JSON 파일을 Parsing한 데이터를 UI를 통하여 확인할 수 있습니다. 출품작 목록은 TableView를 사용해 구성했으며, Dyanamic Type을 통하여 Font Size에 맞는 Text 변경으로 사용자의 사용성을 높였습니다

- [만국박람회 정보](#만국박람회-정보)
- [한국 출품작 리스트](#한국-출품작-리스트)
- [출품작 상세 정보](#출품작-상세-정보)
- [Accessibility (손 쉬운 사용)을 통해 Font Size 변경](#Accessibility-(손-쉬운-사용)을-통해-Font-Size-변경)
- [엑스포 소개 화면 가로모드 배제](#엑스포-소개-화면-가로모드-배제)

### 만국박람회 정보

ScrollView로 구성되어 만국박람회 정보를 확인 가능합니다

<p float= "left">
  <img src="https://user-images.githubusercontent.com/64566207/116000028-84fd6100-a629-11eb-97f4-4cd20d3969e0.gif" height = 500 />
</p>

<br>


### 한국 출품작 리스트

TableView를 통해서 한국의 출품작 리스트를 출력, 간단한 설명을 확인할 수 있습니다

<p>
  <img src="https://user-images.githubusercontent.com/64566207/116000031-862e8e00-a629-11eb-89f3-d26271efbd38.gif" height = 500 />
</p>

<br>


### 출품작 상세 정보

Table Cell 선택 시 해당 Item을 자세하게 소개하는 페이지(ItemInfoViewController) 이동하여 상세 정보 확인 가능합니다

<p>
  <img src="https://user-images.githubusercontent.com/64566207/116000033-875fbb00-a629-11eb-8330-4c287ffbf946.gif" height = 500/>
</p>

<br>

### Accessibility (손 쉬운 사용)을 통해 Font Size 변경

Font Size 변경에 따른 모든 UI 요소들의 크기 변화 적용

<p float="left">
  <img src="https://user-images.githubusercontent.com/64566207/115995169-1a422a80-a615-11eb-9f80-feaaac63da9e.gif" height="500" /> 
</p>

<br>

### 엑스포 소개 화면 가로모드 배제

첫 번째 화면 (엑스포 소개 화면 - ExpositionViewController)의 경우 가로모드를 지원하지 않습니다

<p float="left">
  <img src="https://user-images.githubusercontent.com/64566207/115994931-fcc09100-a613-11eb-906d-2410a39f8df0.png" width="500" />
  <img src="https://user-images.githubusercontent.com/64566207/115994933-fe8a5480-a613-11eb-8a20-5b571e81ad89.png" width="500" /> 
  <img src="https://user-images.githubusercontent.com/64566207/115994935-ffbb8180-a613-11eb-835e-9dfb524c4910.png" width="500" /> 
</p>

<br>

## 3. 설계 및 구현

### JSON 파싱을 위한 모델 설계

아래와 같은 JSON 파일을 대상으로 한 모델을 설계함, camel case를 따르는 swift 네이밍에 맞게 설계하기 위해서 `CodingKey` 프로토콜을 통해 snake case 를 변경시킴

```
[
	{
		"name":"직지심체요절",
		"image_name":"jikji",
		"short_desc":"백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
		"desc":"《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년에 초록한 불교 서적이다. 간단히 직지심체요절..."
	},
	{
		"name":"불경",
		"image_name":"buddhism",
		"short_desc":"석가모니와 그 제자들의 가르침을 모아놓은, 불교의 경전",
		"desc":"불경(佛經, 영어: Buddhist texts)은 석가모니와 그 제자들의 가르침을 모아놓은, 불교의 경전이다.\n\n중복되는 예도 많고 인도, 중국, 티베트, 한국을 거치면서..."
	},
	//...
]

```

<br>

**직접적으로 활용 가능한 모델 구현을 위해서 연산 프로퍼티 활용**

```
{
	"title":"파리 만국박람회 1900(L'Exposition de Paris 1900)",
	"visitors":48130300,
	"location":"프랑스 파리",
	"duration":"1900. 04. 14 - 1900. 11. 12",
	"description":"1900년 파리 만국박람회(지금의 세계 박람회[World’s Fair/Expositi..."
}
```

```swift
struct Exposition: Decodable {
  let title: String
  private let visitors: Int
  let location: String
  let duration: String
  let description: String

  var visitorsStringFormat: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    guard let result = numberFormatter.string(from: NSNumber(value: self.visitors)) else {
      return .blank
    }
    return result
  }
}
```

방문객 숫자의 경우, 1000의 단위로 끊어서 사용하는 decimal format을 사용하기에 파싱과 동시에 연산 프로퍼티를 통해서 변경

<br>

### ViewController 구성

`ExpositionViewController` 의 아래 Button을 통해서 `KoreaItemsListViewController` 로 이동, `KoreaItemsListViewController` 의 각 cell을 통해서 `ItemInfoViewController` 로 이동하도록 구성함. 해당 ViewController들은 NavigationController(Container ViewController) 하위에 있기 때문에 NavigationBar의 Back Button을 통해 이전화면으로 이동할 수 있음

![스크린샷 2021-04-26 오전 1 23 40](https://user-images.githubusercontent.com/64566207/116001178-2d152900-a62e-11eb-8b96-11c2ab023796.png)

<br>

### ViewController 전환시 필요한 데이터 주기

<img width="557" alt="스크린샷 2021-09-16 오전 12 30 07" src="https://user-images.githubusercontent.com/64566207/133463448-ee180479-ec04-448b-97ac-1171054f4be4.png">

목적지 ViewController에 매개체로 사용할 변수 `paramItem`를 설정하고, 전환 전에 `paramItem` 을 통해서 값을 저장

viewDidLoad() 에서 해당 변수를 통해서 UI에 반영

```swift
extension KoreaItemsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let storyboard = UIStoryboard(name: "Main", bundle: .main)
      guard let itemInfoViewController = storyboard.instantiateViewController(identifier: "itemInfoVC") as? ItemInfoViewController else {
        return
      }

      itemInfoViewController.paramItem = self.itemsData[indexPath.row]
      self.navigationController?.pushViewController(itemInfoViewController, animated: true)
  }
}

final class ItemInfoViewController: UIViewController {
  var paramItem: Item?
  //...
  override func viewDidLoad() {
    super.viewDidLoad()
    initializeViews()
  }
  
  private func initializedViews() {
    self.navigationItem.title = paramItem?.name
    guard let imageName = paramItem?.imageName else {
      return
    }
    self.itemImageView.image = UIImage(named: imageName)
    self.itemDescriptionLabel.text = paramItem?.description
  }
}
```

<br>

### Unit Test를 통해서 JSON Parsing 테스트

**Unit Test를 진행한 이유**

UI 구성 이전, JSON Parsing 정확성에 대해 검증을 하기 위해 Unit Test를 진행했습니다. Test를 작성하는데 소요되는 시간이 적지 않지만 여러 환경에 대한 검증을 통해 확신을 가지는 코드를 생성해낼 수 있다는 장점을 경험을 통해 확인했습니다. 

```swift
var decoder: JSONDecoder!
let mockExposition: Data = """
{
  "title":"파리 만국박람회 1900(L'Exposition de Paris 1900)",
  "visitors":48130300,
  "location":"프랑스 파리",
  "duration":"1900. 04. 14 - 1900. 11. 12",
  "description":"1900년 파리에서 열린 Exposition"
}
""".data(using: .utf16)!

override func setUpWithError() throws {
  decoder = JSONDecoder()
}

override func tearDownWithError() throws {
  decoder = nil
}

func testExpositionAssetTitle() {
  do {
    let result = try decoder.decode(Exposition.self, from: mockExposition)
    XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
  } catch {
    XCTFail()
  }
}
```

XCTest Framework의 XCTAssertEqual 메서드를 활용하여 Mock 데이터가 제대로 Parsing 되었는지 검증하였습니다. 

<br>

## 4. 고민했던 점

### TableView에서 선택한 행에 대한 정보를 다음 페이지에 어떻게 줄 것인지?([PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/61#issue-613391509))

아래 두 가지 경우에 대해서 고민하였으나, 두 번의 Parsing은 비효율적인 resource 사용이라고 판단되어서 값을 `paramItem` 을 통해서 전달하였습니다

- `paramItem` 과 같은 변수를 목적지 ViewController 에 두고 전환 이전에 값을 전달한 이후 화면 전환
- `indexPath` 를 넘겨주고 목적지 ViewController 에서 다시 Parsing한 후 `indexPath` 에 맞는 data 사용

<br>

### 하드 코딩 / 매직넘버를 하지 않기 위한 좋은 방법 ([PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/61#issue-613391509))

하드 코딩 / 매직 넘버는 소스의 가독성을 매우 떨어지게 만듭니다. 특정  Int 값, String 값이 "어떠한 목적을 가지는지", "어디에 정확히 사용되는지" 알아보기 힘듭니다. 하드코딩을 줄이게 된다면 업무 효율성 증대를 가져올 수 있습니다.

또한, 자주 사용하는 값의 경우 하나의 상수로 묶어서 사용하면, 이후 코드 리팩토링 과정에서 수정할 시에 상수 깂만 변경하면 된다는 장점이 있습니다

```swift
private let navigationTitle: String = "메인"
private let posterImage: String  = "poster"
private let flagImage: String = "flag"
private let listPageButtonTitle = "한국의 출품작 보러가기"
private let prePhraseVisitors: String = "방문객 : "
private let prePhraseLocation: String = "개최지 : "
private let prePhraseDuration: String = "개최 기간 : "
```

위와 같이 상수로 작성하거나 아래와 같이 하나의 열거형으로 묶어서 관리하도록 하였습니다

```swift
private enum Style {
  static let navigationTitle: String = "메인"
  static let listPageButtonTitle = "한국의 출품작 보러가기"
  static let prePhraseVisitors: String = "방문객 : "
  static let prePhraseLocation: String = "개최지 : "
  static let prePhraseDuration: String = "개최 기간 : "
}
private enum Image {
  static let flag: String = "flag"
  static let poster: String = "poster"
}
```

<br>

## Trouble Shooting

### 화면 복귀시 선택했었된 cell effect가 남는 문제 발생([PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/61#issue-613391509))

아래와 같은 문제를 해결하기 위해서 `Storyboard` Selection 색을 Default로 설정함으로써 해결

<img src="https://user-images.githubusercontent.com/64566207/114362136-f660fc80-9bb1-11eb-85e5-aa6303604898.png">