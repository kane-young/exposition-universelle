# ๐ ๋ง๊ตญ ๋ฐ๋ํ(Exposition)

๐ ํ๋ก์ ํธ ์งํ ๊ธฐ๊ฐ : 2021-04-05 ~ 2021.04.16

### Index

- [Overview](#Overview)
- [๊ธฐ๋ฅ](#๊ธฐ๋ฅ)
- [์ค๊ณ ๋ฐ ๊ตฌํ](#์ค๊ณ-๋ฐ-๊ตฌํ)
- [๊ณ ๋ฏผํ๋ ์ ](#๊ณ ๋ฏผํ๋-์ )
- [Trouble Shooting](#Trouble Shooting)

<br>

## 1. Overview

Json ํ์ผ ๋ด์ Exposition ์ ๋ณด๋ฅผ Scroll View์ Table View์ ์ถ๋ ฅํ๋ App

ํด๋น ์ฑ์ iPhone ์ ์ฉ์ด๋ฉฐ, ์ฒซ ํ๋ฉด์ ๊ฒฝ์ฐ ๊ฐ๋ก๋ชจ๋๋ฅผ ์ง์ํ์ง ์์ต๋๋ค

๋ชจ๋  ํ๋ฉด์์ Dynamic Type์ ์ ์ฉํ์ฌ ์ฌ์ฉ์์ Font Size ์ค์ ์ ๋ฐ๋ฅธ Text ํฌ๊ธฐ ๋ณํ๋ฅผ ์ง์ํฉ๋๋ค



### MVC

JSON Parsing์ ํ๊ธฐ ์ํด ๋ฐ์ดํฐ์ ๋งค์นญ๋๋ `Model`, Parsing๋ ๋ฐ์ดํฐ๋ฅผ ๋ํ๋ด๋ `View`, ๋ ์์๋ฅผ ์ด์ด์ฃผ๋ฉฐ User์ interaction์ ๋ฐ์ํ๋ ViewController๊ฐ ๋จ์ํ ๊ตฌ์กฐ๋ฅผ ๊ฐ์ง๊ณ  ์๊ธฐ์ MVC ์ํคํ์ฒ๋ฅผ ์ฑํํ์ต๋๋ค

<img width="640" alt="์คํฌ๋ฆฐ์ท 2021-09-15 ์คํ 8 01 58" src="https://user-images.githubusercontent.com/64566207/133422170-b3566560-6ae8-4c91-8346-962e69ee20e0.png">

<br>

### Storyboard๋ฅผ ํตํ UI ๊ตฌ์ฑ

AutoLayout์ ๋ํ์ฌ ์ ๋๋ก ์ฒ์ ํ์ตํ๋ ๋จ๊ณ์ด๊ธฐ์, ๊ฐ์์ฑ์ ์ฅ์ ์ผ๋ก ๊ฐ์ง๊ณ  ์๋ Storyboard ๋ฐฉ์์ ํตํด UI๋ฅผ ๊ตฌ์ฑํ์ต๋๋ค. iPhone ์  ๊ธฐ๊ธฐ์ ๋์ํ  ์ ์๋๋ก AutoLayout์ ์ค์ ํ์ผ๋ฉฐ, ScrollView๋ฅผ ํตํ์ฌ Layout ์์๋ค์ ํ์ํ  ์ ์์ต๋๋ค

<p float="left">
  <img src="https://user-images.githubusercontent.com/64566207/133422959-3cc0d640-5758-46cb-845a-bb9ceb0ba2b8.png" height="400">
  <img src="https://user-images.githubusercontent.com/64566207/133422965-2a7e90e9-2bc6-4f01-907d-36512e057f71.png" height="400">
</p>

  <br>

## 2. ๊ธฐ๋ฅ

JSON ํ์ผ์ Parsingํ ๋ฐ์ดํฐ๋ฅผ UI๋ฅผ ํตํ์ฌ ํ์ธํ  ์ ์์ต๋๋ค. ์ถํ์ ๋ชฉ๋ก์ TableView๋ฅผ ์ฌ์ฉํด ๊ตฌ์ฑํ์ผ๋ฉฐ, Dyanamic Type์ ํตํ์ฌ Font Size์ ๋ง๋ Text ๋ณ๊ฒฝ์ผ๋ก ์ฌ์ฉ์์ ์ฌ์ฉ์ฑ์ ๋์์ต๋๋ค

- [๋ง๊ตญ๋ฐ๋ํ ์ ๋ณด](#๋ง๊ตญ๋ฐ๋ํ-์ ๋ณด)
- [ํ๊ตญ ์ถํ์ ๋ฆฌ์คํธ](#ํ๊ตญ-์ถํ์-๋ฆฌ์คํธ)
- [์ถํ์ ์์ธ ์ ๋ณด](#์ถํ์-์์ธ-์ ๋ณด)
- [Accessibility (์ ์ฌ์ด ์ฌ์ฉ)์ ํตํด Font Size ๋ณ๊ฒฝ](#Accessibility-(์-์ฌ์ด-์ฌ์ฉ)์-ํตํด-Font-Size-๋ณ๊ฒฝ)
- [์์คํฌ ์๊ฐ ํ๋ฉด ๊ฐ๋ก๋ชจ๋ ๋ฐฐ์ ](#์์คํฌ-์๊ฐ-ํ๋ฉด-๊ฐ๋ก๋ชจ๋-๋ฐฐ์ )

### ๋ง๊ตญ๋ฐ๋ํ ์ ๋ณด

ScrollView๋ก ๊ตฌ์ฑ๋์ด ๋ง๊ตญ๋ฐ๋ํ ์ ๋ณด๋ฅผ ํ์ธ ๊ฐ๋ฅํฉ๋๋ค

<p float= "left">
  <img src="https://user-images.githubusercontent.com/64566207/116000028-84fd6100-a629-11eb-97f4-4cd20d3969e0.gif" height = 500 />
</p>

<br>


### ํ๊ตญ ์ถํ์ ๋ฆฌ์คํธ

TableView๋ฅผ ํตํด์ ํ๊ตญ์ ์ถํ์ ๋ฆฌ์คํธ๋ฅผ ์ถ๋ ฅ, ๊ฐ๋จํ ์ค๋ช์ ํ์ธํ  ์ ์์ต๋๋ค

<p>
  <img src="https://user-images.githubusercontent.com/64566207/116000031-862e8e00-a629-11eb-89f3-d26271efbd38.gif" height = 500 />
</p>

<br>


### ์ถํ์ ์์ธ ์ ๋ณด

Table Cell ์ ํ ์ ํด๋น Item์ ์์ธํ๊ฒ ์๊ฐํ๋ ํ์ด์ง(ItemInfoViewController) ์ด๋ํ์ฌ ์์ธ ์ ๋ณด ํ์ธ ๊ฐ๋ฅํฉ๋๋ค

<p>
  <img src="https://user-images.githubusercontent.com/64566207/116000033-875fbb00-a629-11eb-8330-4c287ffbf946.gif" height = 500/>
</p>

<br>

### Accessibility (์ ์ฌ์ด ์ฌ์ฉ)์ ํตํด Font Size ๋ณ๊ฒฝ

Font Size ๋ณ๊ฒฝ์ ๋ฐ๋ฅธ ๋ชจ๋  UI ์์๋ค์ ํฌ๊ธฐ ๋ณํ ์ ์ฉ

<p float="left">
  <img src="https://user-images.githubusercontent.com/64566207/115995169-1a422a80-a615-11eb-9f80-feaaac63da9e.gif" height="500" /> 
</p>

<br>

### ์์คํฌ ์๊ฐ ํ๋ฉด ๊ฐ๋ก๋ชจ๋ ๋ฐฐ์ 

์ฒซ ๋ฒ์งธ ํ๋ฉด (์์คํฌ ์๊ฐ ํ๋ฉด - ExpositionViewController)์ ๊ฒฝ์ฐ ๊ฐ๋ก๋ชจ๋๋ฅผ ์ง์ํ์ง ์์ต๋๋ค

<p float="left">
  <img src="https://user-images.githubusercontent.com/64566207/115994931-fcc09100-a613-11eb-906d-2410a39f8df0.png" width="500" />
  <img src="https://user-images.githubusercontent.com/64566207/115994933-fe8a5480-a613-11eb-8a20-5b571e81ad89.png" width="500" /> 
  <img src="https://user-images.githubusercontent.com/64566207/115994935-ffbb8180-a613-11eb-835e-9dfb524c4910.png" width="500" /> 
</p>

<br>

## 3. ์ค๊ณ ๋ฐ ๊ตฌํ

### JSON ํ์ฑ์ ์ํ ๋ชจ๋ธ ์ค๊ณ

์๋์ ๊ฐ์ JSON ํ์ผ์ ๋์์ผ๋ก ํ ๋ชจ๋ธ์ ์ค๊ณํจ, camel case๋ฅผ ๋ฐ๋ฅด๋ swift ๋ค์ด๋ฐ์ ๋ง๊ฒ ์ค๊ณํ๊ธฐ ์ํด์ `CodingKey` ํ๋กํ ์ฝ์ ํตํด snake case ๋ฅผ ๋ณ๊ฒฝ์ํด

```
[
	{
		"name":"์ง์ง์ฌ์ฒด์์ ",
		"image_name":"jikji",
		"short_desc":"๋ฐฑ์ดํ์ ๊ฒฝํ(ๆฏ้)์ด 1372๋์ ์ด๋กํ ๋ถ๊ต ์์ ",
		"desc":"ใ'๋ฐฑ์ดํ์์ด๋ก๋ถ์กฐ์ง์ง์ฌ์ฒด์์ ใ(็ฝ้ฒๅๅฐๆ้ไฝ็ฅ็ดๆๅฟ้ซ่ฆ็ฏ)์ ๋ฐฑ์ดํ์ ๊ฒฝํ(ๆฏ้)์ด 1372๋์ ์ด๋กํ ๋ถ๊ต ์์ ์ด๋ค. ๊ฐ๋จํ ์ง์ง์ฌ์ฒด์์ ..."
	},
	{
		"name":"๋ถ๊ฒฝ",
		"image_name":"buddhism",
		"short_desc":"์๊ฐ๋ชจ๋์ ๊ทธ ์ ์๋ค์ ๊ฐ๋ฅด์นจ์ ๋ชจ์๋์, ๋ถ๊ต์ ๊ฒฝ์ ",
		"desc":"๋ถ๊ฒฝ(ไฝ็ถ, ์์ด: Buddhist texts)์ ์๊ฐ๋ชจ๋์ ๊ทธ ์ ์๋ค์ ๊ฐ๋ฅด์นจ์ ๋ชจ์๋์, ๋ถ๊ต์ ๊ฒฝ์ ์ด๋ค.\n\n์ค๋ณต๋๋ ์๋ ๋ง๊ณ  ์ธ๋, ์ค๊ตญ, ํฐ๋ฒ ํธ, ํ๊ตญ์ ๊ฑฐ์น๋ฉด์..."
	},
	//...
]

```

<br>

**์ง์ ์ ์ผ๋ก ํ์ฉ ๊ฐ๋ฅํ ๋ชจ๋ธ ๊ตฌํ์ ์ํด์ ์ฐ์ฐ ํ๋กํผํฐ ํ์ฉ**

```
{
	"title":"ํ๋ฆฌ ๋ง๊ตญ๋ฐ๋ํ 1900(L'Exposition de Paris 1900)",
	"visitors":48130300,
	"location":"ํ๋์ค ํ๋ฆฌ",
	"duration":"1900. 04. 14 - 1900. 11. 12",
	"description":"1900๋ ํ๋ฆฌ ๋ง๊ตญ๋ฐ๋ํ(์ง๊ธ์ ์ธ๊ณ ๋ฐ๋ํ[Worldโs Fair/Expositi..."
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

๋ฐฉ๋ฌธ๊ฐ ์ซ์์ ๊ฒฝ์ฐ, 1000์ ๋จ์๋ก ๋์ด์ ์ฌ์ฉํ๋ decimal format์ ์ฌ์ฉํ๊ธฐ์ ํ์ฑ๊ณผ ๋์์ ์ฐ์ฐ ํ๋กํผํฐ๋ฅผ ํตํด์ ๋ณ๊ฒฝ

<br>

### ViewController ๊ตฌ์ฑ

`ExpositionViewController` ์ ์๋ Button์ ํตํด์ `KoreaItemsListViewController` ๋ก ์ด๋, `KoreaItemsListViewController` ์ ๊ฐ cell์ ํตํด์ `ItemInfoViewController` ๋ก ์ด๋ํ๋๋ก ๊ตฌ์ฑํจ. ํด๋น ViewController๋ค์ NavigationController(Container ViewController) ํ์์ ์๊ธฐ ๋๋ฌธ์ NavigationBar์ Back Button์ ํตํด ์ด์ ํ๋ฉด์ผ๋ก ์ด๋ํ  ์ ์์

![์คํฌ๋ฆฐ์ท 2021-04-26 ์ค์  1 23 40](https://user-images.githubusercontent.com/64566207/116001178-2d152900-a62e-11eb-8b96-11c2ab023796.png)

<br>

### ViewController ์ ํ์ ํ์ํ ๋ฐ์ดํฐ ์ฃผ๊ธฐ

<img width="557" alt="์คํฌ๋ฆฐ์ท 2021-09-16 ์ค์  12 30 07" src="https://user-images.githubusercontent.com/64566207/133463448-ee180479-ec04-448b-97ac-1171054f4be4.png">

๋ชฉ์ ์ง ViewController์ ๋งค๊ฐ์ฒด๋ก ์ฌ์ฉํ  ๋ณ์ `paramItem`๋ฅผ ์ค์ ํ๊ณ , ์ ํ ์ ์ `paramItem` ์ ํตํด์ ๊ฐ์ ์ ์ฅ

viewDidLoad() ์์ ํด๋น ๋ณ์๋ฅผ ํตํด์ UI์ ๋ฐ์

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

### Unit Test๋ฅผ ํตํด์ JSON Parsing ํ์คํธ

**Unit Test๋ฅผ ์งํํ ์ด์ **

UI ๊ตฌ์ฑ ์ด์ , JSON Parsing ์ ํ์ฑ์ ๋ํด ๊ฒ์ฆ์ ํ๊ธฐ ์ํด Unit Test๋ฅผ ์งํํ์ต๋๋ค. Test๋ฅผ ์์ฑํ๋๋ฐ ์์๋๋ ์๊ฐ์ด ์ ์ง ์์ง๋ง ์ฌ๋ฌ ํ๊ฒฝ์ ๋ํ ๊ฒ์ฆ์ ํตํด ํ์ ์ ๊ฐ์ง๋ ์ฝ๋๋ฅผ ์์ฑํด๋ผ ์ ์๋ค๋ ์ฅ์ ์ ๊ฒฝํ์ ํตํด ํ์ธํ์ต๋๋ค. 

```swift
var decoder: JSONDecoder!
let mockExposition: Data = """
{
  "title":"ํ๋ฆฌ ๋ง๊ตญ๋ฐ๋ํ 1900(L'Exposition de Paris 1900)",
  "visitors":48130300,
  "location":"ํ๋์ค ํ๋ฆฌ",
  "duration":"1900. 04. 14 - 1900. 11. 12",
  "description":"1900๋ ํ๋ฆฌ์์ ์ด๋ฆฐ Exposition"
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
    XCTAssertEqual(result.title, "ํ๋ฆฌ ๋ง๊ตญ๋ฐ๋ํ 1900(L'Exposition de Paris 1900)")
  } catch {
    XCTFail()
  }
}
```

XCTest Framework์ XCTAssertEqual ๋ฉ์๋๋ฅผ ํ์ฉํ์ฌ Mock ๋ฐ์ดํฐ๊ฐ ์ ๋๋ก Parsing ๋์๋์ง ๊ฒ์ฆํ์์ต๋๋ค. 

<br>

## 4. ๊ณ ๋ฏผํ๋ ์ 

### TableView์์ ์ ํํ ํ์ ๋ํ ์ ๋ณด๋ฅผ ๋ค์ ํ์ด์ง์ ์ด๋ป๊ฒ ์ค ๊ฒ์ธ์ง?([PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/61#issue-613391509))

์๋ ๋ ๊ฐ์ง ๊ฒฝ์ฐ์ ๋ํด์ ๊ณ ๋ฏผํ์์ผ๋, ๋ ๋ฒ์ Parsing์ ๋นํจ์จ์ ์ธ resource ์ฌ์ฉ์ด๋ผ๊ณ  ํ๋จ๋์ด์ ๊ฐ์ `paramItem` ์ ํตํด์ ์ ๋ฌํ์์ต๋๋ค

- `paramItem` ๊ณผ ๊ฐ์ ๋ณ์๋ฅผ ๋ชฉ์ ์ง ViewController ์ ๋๊ณ  ์ ํ ์ด์ ์ ๊ฐ์ ์ ๋ฌํ ์ดํ ํ๋ฉด ์ ํ
- `indexPath` ๋ฅผ ๋๊ฒจ์ฃผ๊ณ  ๋ชฉ์ ์ง ViewController ์์ ๋ค์ Parsingํ ํ `indexPath` ์ ๋ง๋ data ์ฌ์ฉ

<br>

### ํ๋ ์ฝ๋ฉ / ๋งค์ง๋๋ฒ๋ฅผ ํ์ง ์๊ธฐ ์ํ ์ข์ ๋ฐฉ๋ฒ ([PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/61#issue-613391509))

ํ๋ ์ฝ๋ฉ / ๋งค์ง ๋๋ฒ๋ ์์ค์ ๊ฐ๋์ฑ์ ๋งค์ฐ ๋จ์ด์ง๊ฒ ๋ง๋ญ๋๋ค. ํน์   Int ๊ฐ, String ๊ฐ์ด "์ด๋ ํ ๋ชฉ์ ์ ๊ฐ์ง๋์ง", "์ด๋์ ์ ํํ ์ฌ์ฉ๋๋์ง" ์์๋ณด๊ธฐ ํ๋ญ๋๋ค. ํ๋์ฝ๋ฉ์ ์ค์ด๊ฒ ๋๋ค๋ฉด ์๋ฌด ํจ์จ์ฑ ์ฆ๋๋ฅผ ๊ฐ์ ธ์ฌ ์ ์์ต๋๋ค.

๋ํ, ์์ฃผ ์ฌ์ฉํ๋ ๊ฐ์ ๊ฒฝ์ฐ ํ๋์ ์์๋ก ๋ฌถ์ด์ ์ฌ์ฉํ๋ฉด, ์ดํ ์ฝ๋ ๋ฆฌํฉํ ๋ง ๊ณผ์ ์์ ์์ ํ  ์์ ์์ ๊น๋ง ๋ณ๊ฒฝํ๋ฉด ๋๋ค๋ ์ฅ์ ์ด ์์ต๋๋ค

```swift
private let navigationTitle: String = "๋ฉ์ธ"
private let posterImage: String  = "poster"
private let flagImage: String = "flag"
private let listPageButtonTitle = "ํ๊ตญ์ ์ถํ์ ๋ณด๋ฌ๊ฐ๊ธฐ"
private let prePhraseVisitors: String = "๋ฐฉ๋ฌธ๊ฐ : "
private let prePhraseLocation: String = "๊ฐ์ต์ง : "
private let prePhraseDuration: String = "๊ฐ์ต ๊ธฐ๊ฐ : "
```

์์ ๊ฐ์ด ์์๋ก ์์ฑํ๊ฑฐ๋ ์๋์ ๊ฐ์ด ํ๋์ ์ด๊ฑฐํ์ผ๋ก ๋ฌถ์ด์ ๊ด๋ฆฌํ๋๋ก ํ์์ต๋๋ค

```swift
private enum Style {
  static let navigationTitle: String = "๋ฉ์ธ"
  static let listPageButtonTitle = "ํ๊ตญ์ ์ถํ์ ๋ณด๋ฌ๊ฐ๊ธฐ"
  static let prePhraseVisitors: String = "๋ฐฉ๋ฌธ๊ฐ : "
  static let prePhraseLocation: String = "๊ฐ์ต์ง : "
  static let prePhraseDuration: String = "๊ฐ์ต ๊ธฐ๊ฐ : "
}
private enum Image {
  static let flag: String = "flag"
  static let poster: String = "poster"
}
```

<br>

## Trouble Shooting

### ํ๋ฉด ๋ณต๊ท์ ์ ํํ์๋ cell effect๊ฐ ๋จ๋ ๋ฌธ์  ๋ฐ์([PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/61#issue-613391509))

์๋์ ๊ฐ์ ๋ฌธ์ ๋ฅผ ํด๊ฒฐํ๊ธฐ ์ํด์ `Storyboard` Selection ์์ Default๋ก ์ค์ ํจ์ผ๋ก์จ ํด๊ฒฐ

<img src="https://user-images.githubusercontent.com/64566207/114362136-f660fc80-9bb1-11eb-85e5-aa6303604898.png">