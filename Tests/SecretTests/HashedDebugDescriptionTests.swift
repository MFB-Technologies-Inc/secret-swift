// HashedDebugDescriptionTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Secret
import XCTest

final class HashedDebugDescriptionTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Hashed(SinglePropertyStruct())
        XCTAssertEqual(value.debugDescription, "SinglePropertyStruct: \(value.wrappedValue.hashValue.description)")
    }

    func testMultiPropertyStruct() throws {
        let value = Hashed(MultiPropertyStruct())
        XCTAssertEqual(value.debugDescription, "MultiPropertyStruct: \(value.wrappedValue.hashValue.description)")
    }

    func testSinglePropertyClass() throws {
        let value = Hashed(SinglePropertyClass())
        XCTAssertEqual(value.debugDescription, "SinglePropertyClass: \(value.wrappedValue.hashValue.description)")
    }

    func testSinglePropertySubClass() throws {
        let value = Hashed(SinglePropertySubClass())
        XCTAssertEqual(value.debugDescription, "SinglePropertySubClass: \(value.wrappedValue.hashValue.description)")
    }

    func testSinglePropertyFinalClass() throws {
        let value = Hashed(SinglePropertyFinalClass())
        XCTAssertEqual(value.debugDescription, "SinglePropertyFinalClass: \(value.wrappedValue.hashValue.description)")
    }

    func testSingleCaseEnum() throws {
        let value = Hashed(SingleCaseEnum.secret)
        XCTAssertEqual(value.debugDescription, "SingleCaseEnum: \(value.wrappedValue.hashValue.description)")
    }

    func testMultiCaseEnum() throws {
        let value = Hashed(MultiCaseEnum.secretA)
        XCTAssertEqual(value.debugDescription, "MultiCaseEnum: \(value.wrappedValue.hashValue.description)")
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Hashed(SingleCaseAssociatedValueEnum.secret("SECRET_VALUE"))
        XCTAssertEqual(
            value.debugDescription,
            "SingleCaseAssociatedValueEnum: \(value.wrappedValue.hashValue.description)"
        )
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Hashed(MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE"))
        XCTAssertEqual(
            value.debugDescription,
            "MultiCaseAssociatedValueEnum: \(value.wrappedValue.hashValue.description)"
        )
    }

    func testSinglePropertyActor() throws {
        let value = Hashed(SinglePropertyActor())
        XCTAssertEqual(value.debugDescription, "SinglePropertyActor: \(value.wrappedValue.hashValue.description)")
    }

    func testMultiPropertyActor() throws {
        let value = Hashed(MultiPropertyActor())
        XCTAssertEqual(value.debugDescription, "MultiPropertyActor: \(value.wrappedValue.hashValue.description)")
    }
}
