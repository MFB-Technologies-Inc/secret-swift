// RedactedReflectionTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Secret
import XCTest

final class RedactedReflectionTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Redacted(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testMultiPropertyStruct() throws {
        let value = Redacted(MultiPropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testSinglePropertyClass() throws {
        let value = Redacted(SinglePropertyClass())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testSinglePropertySubClass() throws {
        let value = Redacted(SinglePropertySubClass())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testSinglePropertyFinalClass() throws {
        let value = Redacted(SinglePropertyFinalClass())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testSingleCaseEnum() throws {
        let value = Redacted(SingleCaseEnum.secret)
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testMultiCaseEnum() throws {
        let value = Redacted(MultiCaseEnum.secretA)
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Redacted(SingleCaseAssociatedValueEnum.secret("SECRET_VALUE"))
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Redacted(MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE"))
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testSinglePropertyActor() throws {
        let value = Redacted(SinglePropertyActor())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }

    func testMultiPropertyActor() throws {
        let value = Redacted(MultiPropertyActor())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        for child in mirror.children {
            guard let _value = child.value as? String else {
                XCTFail("Mirror.Child.value failed to cast to String.")
                return
            }
            XCTAssertEqual(_value, "REDACTED")
        }
    }
}
