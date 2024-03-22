// RedactedEncodingTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import Secret
import XCTest

final class RedactedEncodingTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Redacted(SinglePropertyStruct())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testMultiPropertyStruct() throws {
        let value = Redacted(MultiPropertyStruct())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSinglePropertyClass() throws {
        let value = Redacted(SinglePropertyClass())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSinglePropertySubClass() throws {
        let value = Redacted(SinglePropertySubClass())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSinglePropertyFinalClass() throws {
        let value = Redacted(SinglePropertyFinalClass())
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSingleCaseEnum() throws {
        let value = Redacted(SingleCaseEnum.secret)
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testMultiCaseEnum() throws {
        let value = Redacted(MultiCaseEnum.secretA)
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Redacted(SingleCaseAssociatedValueEnum.secret("SECRET_VALUE"))
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Redacted(MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE"))
        let encoded = try JSONEncoder().encode(value)
        let encodedString = try XCTUnwrap(String(data: encoded, encoding: .utf8))
        let expectedString = "\"REDACTED\""
        XCTAssertEqual(encodedString, expectedString)
    }
}
