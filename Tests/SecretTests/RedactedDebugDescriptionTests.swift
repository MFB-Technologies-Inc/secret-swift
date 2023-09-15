// RedactedDebugDescriptionTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Secret
import XCTest

final class RedactedDebugDescriptionTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Redacted(SinglePropertyStruct())
        XCTAssertEqual(value.debugDescription, "SinglePropertyStruct: REDACTED")
    }

    func testMultiPropertyStruct() throws {
        let value = Redacted(MultiPropertyStruct())
        XCTAssertEqual(value.debugDescription, "MultiPropertyStruct: REDACTED")
    }

    func testSinglePropertyClass() throws {
        let value = Redacted(SinglePropertyClass())
        XCTAssertEqual(value.debugDescription, "SinglePropertyClass: REDACTED")
    }

    func testSinglePropertySubClass() throws {
        let value = Redacted(SinglePropertySubClass())
        XCTAssertEqual(value.debugDescription, "SinglePropertySubClass: REDACTED")
    }

    func testSinglePropertyFinalClass() throws {
        let value = Redacted(SinglePropertyFinalClass())
        XCTAssertEqual(value.debugDescription, "SinglePropertyFinalClass: REDACTED")
    }

    func testSingleCaseEnum() throws {
        let value = Redacted(SingleCaseEnum.secret)
        XCTAssertEqual(value.debugDescription, "SingleCaseEnum: REDACTED")
    }

    func testMultiCaseEnum() throws {
        let value = Redacted(MultiCaseEnum.secretA)
        XCTAssertEqual(value.debugDescription, "MultiCaseEnum: REDACTED")
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Redacted(SingleCaseAssociatedValueEnum.secret("SECRET_VALUE"))
        XCTAssertEqual(value.debugDescription, "SingleCaseAssociatedValueEnum: REDACTED")
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Redacted(MultiCaseAssociatedValueEnum.secretA("SECRET_VALUE"))
        XCTAssertEqual(value.debugDescription, "MultiCaseAssociatedValueEnum: REDACTED")
    }

    func testSinglePropertyActor() throws {
        let value = Redacted(SinglePropertyActor())
        XCTAssertEqual(value.debugDescription, "SinglePropertyActor: REDACTED")
    }

    func testMultiPropertyActor() throws {
        let value = Redacted(MultiPropertyActor())
        XCTAssertEqual(value.debugDescription, "MultiPropertyActor: REDACTED")
    }
}
