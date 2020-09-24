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
import XCTest
import Foundation
import SwiftRT

class test_Fractals: XCTestCase {
    //==========================================================================
    // support terminal test run
    static var allTests = [
        ("test_Julia", test_Julia),
        ("test_pmapJulia", test_pmapJulia),
        ("test_pmapJuliaKernel", test_pmapJuliaKernel),
    ]

    // append and use a discrete async cpu device for these tests
    override func setUpWithError() throws {
        log.level = .diagnostic
    }

    override func tearDownWithError() throws {
        log.level = .error
    }

    //--------------------------------------------------------------------------
    func test_Julia() {
        // parameters
        let iterations = 2048
        let size = (1024, 1025)
        let tolerance: Float = 4.0
        let C = Complex<Float>(-0.8, 0.156)
        let first = Complex<Float>(-1.7, -1.7)
        let last = Complex<Float>(1.7, 1.7)
        
        var Z = array(from: first, to: last, size)
        var divergence = full(size, iterations)

        let start = Date()
        
        // 14.820s
        for i in 0..<iterations {
            Z = multiply(Z, Z, add: C)
            divergence[abs(Z) .> tolerance] = min(divergence, i)
        }

        print("time: \(Date().timeIntervalSince(start))")
    }

    //--------------------------------------------------------------------------
    func test_pmapJulia() {
        // parameters
        let iterations = 2048
        let size = (1024, 1025)
        let tolerance: Float = 4.0
        let C = Complex<Float>(-0.8, 0.156)
        let first = Complex<Float>(-1.7, -1.7)
        let last = Complex<Float>(1.7, 1.7)

        
        let Z = array(from: first, to: last, size)
        var divergence = full(size, iterations)

        // 0.733
        measure {
            pmap(Z, &divergence) { Z, divergence in
                for i in 0..<iterations {
                    Z = multiply(Z, Z, add: C)
                    divergence[abs(Z) .> tolerance] = min(divergence, i)
                }
            }
        }
    }

    func test_pmapJuliaKernel() {
        // parameters
        let iterations = 2048
        let size = (1024, 1025)
        let tolerance: Float = 4.0
        let C = Complex<Float>(-0.8, 0.156)
        let first = Complex<Float>(-1.7, -1.7)
        let last = Complex<Float>(1.7, 1.7)
        
        let Z = array(from: first, to: last, size)
        var divergence = full(size, iterations)
        
        // 0.276s
        measure {
            pmap(Z, &divergence, boundBy: .compute) {
                juliaKernel(Z: $0, divergence: &$1, C, tolerance, iterations)
            }
        }
    }
}

//==============================================================================
// user defined element wise function
@inlinable public func juliaKernel<E>(
    Z: TensorR2<Complex<E>>,
    divergence: inout TensorR2<E>,
    _ C: Complex<E>,
    _ tolerance: E,
    _ iterations: Int
) {
    let message = diagnosticMessage(
        "julia(Z: \(Z.name), divergence: \(divergence.name), constant: \(C), " +
            "tolerance: \(tolerance), iterations: \(iterations))")

    kernel(Z, &divergence, message) {
        var Z = $0, d = $1
        var i = E.zero
        for _ in 0..<iterations {
            Z = Z * Z + C
            if abs(Z) > tolerance { d = min(d, i) }
            i += 1
        }
        return d
    }
}
