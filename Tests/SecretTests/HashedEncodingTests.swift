// HashedEncodingTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import Secret
import XCTest

final class HashedEncodingTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Hashed(SinglePropertyStruct())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testMultiPropertyStruct() throws {
        let value = Hashed(MultiPropertyStruct())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSinglePropertyClass() throws {
        let value = Hashed(SinglePropertyClass())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSinglePropertySubClass() throws {
        let value = Hashed(SinglePropertySubClass())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSinglePropertyFinalClass() throws {
        let value = Hashed(SinglePropertyFinalClass())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSingleCaseEnum() throws {
        let value = Hashed(SingleCaseEnum.secret)
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testMultiCaseEnum() throws {
        let value = Hashed(MultiCaseEnum.secretA)
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Hashed(SingleCaseAssociatedValueEnum.secret("SECRET_VALUE"))
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Hashed(MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE"))
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = value.wrappedValue.hashValue.description
        XCTAssertEqual(encodedString, expectedString)
    }

    func testHashedContainer() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let value = HashedContainer()
        let encoded = try encoder.encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "{\"nonSecretValue\":\"Non-Secret\",\"secretValue\":\(value.secretValue.hashValue)}"
        XCTAssertEqual(encodedString, expectedString)
    }

    func testHashedDecodableContainer() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let value = HashedDecodableContainer()
        let encoded = try encoder.encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "{\"nonSecretValue\":\"Non-Secret\",\"secretValue\":\(value.secretValue.hashValue)}"
        XCTAssertEqual(encodedString, expectedString)
    }
}
