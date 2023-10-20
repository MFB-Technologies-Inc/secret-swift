// HashedDescriptionTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Secret
import XCTest

final class HashedDescriptionTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Hashed(SinglePropertyStruct())
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testMultiPropertyStruct() throws {
        let value = Hashed(MultiPropertyStruct())
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testSinglePropertyClass() throws {
        let value = Hashed(SinglePropertyClass())
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testSinglePropertySubClass() throws {
        let value = Hashed(SinglePropertySubClass())
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testSinglePropertyFinalClass() throws {
        let value = Hashed(SinglePropertyFinalClass())
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testSingleCaseEnum() throws {
        let value = Hashed(SingleCaseEnum.secret)
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testMultiCaseEnum() throws {
        let value = Hashed(MultiCaseEnum.secretA)
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Hashed(SingleCaseAssociatedValueEnum.secret("SECRET_VALUE"))
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Hashed(MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE"))
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    @available(iOS 13, tvOS 13, macOS 10.15, watchOS 6, *)
    func testSinglePropertyActor() throws {
        let value = Hashed(SinglePropertyActor())
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }

    @available(iOS 13, tvOS 13, macOS 10.15, watchOS 6, *)
    func testMultiPropertyActor() throws {
        let value = Hashed(MultiPropertyActor())
        XCTAssertEqual(value.description, value.wrappedValue.hashValue.description)
    }
}
