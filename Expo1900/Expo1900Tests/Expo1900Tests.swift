//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 이영우 on 2021/04/06.
//

import XCTest
import Foundation
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    private var decoder: JSONDecoder!
    private let itemJson: String = "items"
    private let expoJson: String = "exposition_universelle_1900"
    private let mockExposition: Data = """
        {
            "title":"파리 만국박람회 1900(L'Exposition de Paris 1900)",
            "visitors":48130300,
            "location":"프랑스 파리",
            "duration":"1900. 04. 14 - 1900. 11. 12",
            "description":"1900년 파리에서 열린 Exposition"
        }
        """.data(using: .utf16)!
    private let mockItems: Data = """
        [
            {
                "name":"직지심체요절",
                "image_name":"jikji",
                "short_desc":"백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
                "desc":"직지심체요절, 직지라고도 부르는 불교 서적이다"
            }
        ]
        """.data(using: .utf16)!
    
    override func setUpWithError() throws {
        decoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        decoder = nil
    }

    func testItemAssetName() {
        do {
            let result = try decoder.decode([Item].self, from: mockItems)
            XCTAssertEqual(result.first?.name, "직지심체요절")
        } catch {
            XCTFail()
        }
    }
    
    func testItemAssetImageName() {
        do {
            let result = try decoder.decode([Item].self, from: mockItems)
            XCTAssertEqual(result.first?.imageName, "jikji")
        } catch {
            XCTFail()
        }
    }
    
    func testExpositionAssetTitle() {
        do {
            let result = try decoder.decode(Exposition.self, from: mockExposition)
            XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
        } catch {
            XCTFail()
        }
    }
    
    func testExpositionAssetVisitorsFormatter() {
        do {
            let result = try decoder.decode(Exposition.self, from: mockExposition)
            XCTAssertEqual(result.visitorsStringFormat, "48,130,300")
        } catch {
            XCTFail()
        }
    }
}
