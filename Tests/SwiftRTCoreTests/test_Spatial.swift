//******************************************************************************
// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import SwiftRT
import XCTest
import _Differentiation

class test_Spatial: XCTestCase {
  //==========================================================================
  // support terminal test run
  static var allTests = [
    ("test_averagePool", test_averagePool),
    ("test_maxPool", test_maxPool),
  ]

  //--------------------------------------------------------------------------
  func test_averagePool() {
    #if canImport(SwiftRTCuda)
      do {
        let a = array([
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8],
        ])

        // same
        let same = pool(x: a, size: (3, 2), strides: (1, 1), pad: .same, mode: .average)
        print(same)
        XCTAssert(
          same == [
            [2.0, 2.5, 3.0],
            [3.5, 4.0, 4.5],
            [5.0, 5.5, 6.0],
          ])

        // valid
        let valid = pool(x: a, size: (3, 3), strides: (1, 1), pad: .valid, mode: .average)
        XCTAssert(valid == [[4.0]])

        // using a configuration
        let cfg = PoolingConfiguration(
          x: a, size: (3, 3), strides: (1, 1), pad: .valid, mode: .average)
        var out = cfg.createOutput()
        let p = pool(config: cfg, x: a, out: &out)
        XCTAssert(p == [[4.0]])
      }

      do {
        let a = array(0..<25, shape: (5, 5))

        // same
        let same = pool(x: a, size: (5, 5), strides: (1, 1), pad: .same, mode: .average)
        let expsame = array([
          [6.0, 6.5, 7.0, 7.5, 8.0],
          [8.5, 9.0, 9.5, 10.0, 10.5],
          [11.0, 11.5, 12.0, 12.5, 13.0],
          [13.5, 14.0, 14.5, 15.0, 15.5],
          [16.0, 16.5, 17.0, 17.5, 18.0],
        ])
        XCTAssert(elementsAlmostEqual(same, expsame, tolerance: 0.001).all().element)

        // valid
        let valid = pool(x: a, size: (5, 5), strides: (1, 1), pad: .valid, mode: .average)
        print(valid)
        XCTAssert(valid == [[12.0]])

        // using a configuration
        let cfg = PoolingConfiguration(
          x: a, size: (5, 5), strides: (1, 1), pad: .valid, mode: .average)
        var out = cfg.createOutput()
        let p = pool(config: cfg, x: a, out: &out)
        XCTAssert(p == [[12.0]])
      }
    #endif
  }

  //--------------------------------------------------------------------------
  func test_maxPool() {
    #if canImport(SwiftRTCuda)
      let a = array([
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
      ])

      // same
      let same = pool(x: a, size: (3, 3), strides: (1, 1), pad: .same, mode: .max)
      XCTAssert(
        same == [
          [4.0, 5.0, 5.0],
          [7.0, 8.0, 8.0],
          [7.0, 8.0, 8.0],
        ])

      // valid
      let valid = pool(x: a, size: (3, 3), strides: (1, 1), pad: .valid, mode: .max)
      XCTAssert(valid == [[8.0]])
    #endif
  }
}
