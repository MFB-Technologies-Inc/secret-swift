// RedactedDecodingTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import Secret
import XCTest

final class RedactedDecodingTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let wrappedValue = SinglePropertyStruct()
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<SinglePropertyStruct>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testMultiPropertyStruct() throws {
        let wrappedValue = MultiPropertyStruct()
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<MultiPropertyStruct>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testSinglePropertyClass() throws {
        let wrappedValue = SinglePropertyClass()
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<SinglePropertyClass>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testSinglePropertySubClass() throws {
        let wrappedValue = SinglePropertySubClass()
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<SinglePropertySubClass>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testSinglePropertyFinalClass() throws {
        let wrappedValue = SinglePropertyFinalClass()
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<SinglePropertyFinalClass>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testSingleCaseEnum() throws {
        let wrappedValue = SingleCaseEnum.secret
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<SingleCaseEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testMultiCaseEnum() throws {
        let wrappedValue = MultiCaseEnum.secretA
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<MultiCaseEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let wrappedValue = SingleCaseAssociatedValueEnum.secret("SECRET_VALUE")
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<SingleCaseAssociatedValueEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let wrappedValue = MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE")
        let value = Redacted(wrappedValue: wrappedValue)
        let valueType = Redacted<MultiCaseAssociatedValueEnum>.self
        let encoded = try JSONEncoder().encode(wrappedValue)
        let decodedRedacted = try JSONDecoder().decode(valueType, from: encoded)
        XCTAssertEqual(decodedRedacted, value)
    }
}
