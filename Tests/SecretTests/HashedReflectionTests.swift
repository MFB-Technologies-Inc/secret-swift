// HashedReflectionTests.swift
// Secret
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Secret
import XCTest

final class HashedReflectionTests: XCTestCase {
    func testSinglePropertyStruct() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testMultiPropertyStruct() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testSinglePropertyClass() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testSinglePropertySubClass() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testSinglePropertyFinalClass() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testSingleCaseEnum() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testMultiCaseEnum() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testSingleCaseAssociatedValueEnum() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    func testMultiCaseAssociatedValueEnum() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    @available(iOS 13, tvOS 13, macOS 10.15, watchOS 6, *)
    func testSinglePropertyActor() async throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }

    @available(iOS 13, tvOS 13, macOS 10.15, watchOS 6, *)
    func testMultiPropertyActor() throws {
        let value = Hashed(SinglePropertyStruct())
        let mirror = Mirror(reflecting: value)
        if let displayStyle = mirror.displayStyle {
            XCTFail(
                "Mirror.displayStyle was expected to be `nil` but was \(displayStyle.description) instead"
            )
        }
        guard mirror.children.count == 1 else {
            XCTFail("Expected 1 child but found \(mirror.children.count)")
            return
        }
        guard let hash = mirror.children.first?.value as? Int else {
            XCTFail("Failed to case child to Int")
            return
        }
        XCTAssertEqual(value.wrappedValue.hashValue, hash)
    }
}
