// HashedDecodingTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import Secret
import XCTest

final class HashedDecodingTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let wrappedValue = SinglePropertyStruct()
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<SinglePropertyStruct>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testMultiPropertyStruct() throws {
        let wrappedValue = MultiPropertyStruct()
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<MultiPropertyStruct>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testSinglePropertyClass() throws {
        let wrappedValue = SinglePropertyClass()
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<SinglePropertyClass>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testSinglePropertySubClass() throws {
        let wrappedValue = SinglePropertySubClass()
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<SinglePropertySubClass>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testSinglePropertyFinalClass() throws {
        let wrappedValue = SinglePropertyFinalClass()
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<SinglePropertyFinalClass>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testSingleCaseEnum() throws {
        let wrappedValue = SingleCaseEnum.secret
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<SingleCaseEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testMultiCaseEnum() throws {
        let wrappedValue = MultiCaseEnum.secretA
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<MultiCaseEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let wrappedValue = SingleCaseAssociatedValueEnum.secret("SECRET_VALUE")
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<SingleCaseAssociatedValueEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let wrappedValue = MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE")
        let value = Hashed(wrappedValue: wrappedValue)
        let valueType = Hashed<MultiCaseAssociatedValueEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedHashed = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedHashed, value)
    }

    func testHashedContainer() throws {
        let value = HashedContainer()
        let encoded = try JSONEncoder().encode(value)
        try XCTAssertThrowsError(JSONDecoder().decode(HashedContainer.self, from: encoded))
    }

    func testHashedDecodableContainer() throws {
        let value = HashedDecodableContainer()
        let encoded = try JSONEncoder().encode(value)
        let decodedHashed = try JSONDecoder().decode(HashedDecodableContainer.self, from: encoded)
        XCTAssertNotEqual(decodedHashed.secretValue, value.secretValue)
        XCTAssertEqual(decodedHashed.nonSecretValue, value.nonSecretValue)
    }
}
