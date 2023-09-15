// RedactedDescriptionTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Secret
import XCTest

final class RedactedDescriptionTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Redacted(SinglePropertyStruct())
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testMultiPropertyStruct() throws {
        let value = Redacted(MultiPropertyStruct())
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testSinglePropertyClass() throws {
        let value = Redacted(SinglePropertyClass())
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testSinglePropertySubClass() throws {
        let value = Redacted(SinglePropertySubClass())
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testSinglePropertyFinalClass() throws {
        let value = Redacted(SinglePropertyFinalClass())
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testSingleCaseEnum() throws {
        let value = Redacted(SingleCaseEnum.secret)
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testMultiCaseEnum() throws {
        let value = Redacted(MultiCaseEnum.secretA)
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Redacted(SingleCaseAssociatedValueEnum.secret("SECRET_VALUE"))
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Redacted(MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE"))
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testSinglePropertyActor() throws {
        let value = Redacted(SinglePropertyActor())
        XCTAssertEqual(value.description, "REDACTED")
    }

    func testMultiPropertyActor() throws {
        let value = Redacted(MultiPropertyActor())
        XCTAssertEqual(value.description, "REDACTED")
    }
}
