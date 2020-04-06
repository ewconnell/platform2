//******************************************************************************
// Copyright 2020 Google LLC
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

// gyb utility docs
// https://nshipster.com/swift-gyb/

//******************************************************************************
//
// DO NOT EDIT. THIS FILE IS GENERATED FROM swift.gyb file
//
//******************************************************************************

/// `TensorType Subscript Behavior`
/// A tensor subscripted with a range returns a tensor slice.
/// A tensor subscripted using `tensor.indices` or an index formed
/// via the `ElementIndex` structure, will return the tensor's `Elements`
/// A tensor subscripted with integers for each dimension is a convenience
/// function for wrapping the values in a `ElementIndex` structure, and
/// then returning the corresponding tensor `Element`

//==============================================================================
// Rank1
public extension TensorType where Shape == Shape1 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int) -> Element {
        self[makeIndex(at: Shape1(d0))]
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0>(r0: R0) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int
    {
        let d0 = r0.relativeTo(0..<shape[0])
        let lower = Shape1(d0.start)
        let upper = Shape1(d0.end)
        return self[lower, upper]
    }
}

//------------------------------------------------------------------------------

public extension MutableTensorType where Shape == Shape1 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int) -> Element {
        get { self[makeIndex(at: Shape1(d0))] }
        set { self[makeIndex(at: Shape1(d0))] = newValue }
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0>(r0: R0) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int
    {
        get {
            let d0 = r0.relativeTo(0..<shape[0])
            let lower = Shape1(d0.start)
            let upper = Shape1(d0.end)
            return self[lower, upper]
        }
        
        set {
            let d0 = r0.relativeTo(0..<shape[0])
            let lower = Shape1(d0.start)
            let upper = Shape1(d0.end)
            self[lower, upper] = newValue
        }
    }
}

//==============================================================================
// Rank2
public extension TensorType where Shape == Shape2 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int) -> Element {
        self[makeIndex(at: Shape2(d0, d1))]
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1>(r0: R0, r1: R1) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int
    {
        let d0 = r0.relativeTo(0..<shape[0])
        let d1 = r1.relativeTo(0..<shape[1])
        let lower = Shape2(d0.start, d1.start)
        let upper = Shape2(d0.end, d1.end)
        return self[lower, upper]
    }
}

//------------------------------------------------------------------------------

public extension MutableTensorType where Shape == Shape2 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int) -> Element {
        get { self[makeIndex(at: Shape2(d0, d1))] }
        set { self[makeIndex(at: Shape2(d0, d1))] = newValue }
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1>(r0: R0, r1: R1) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int
    {
        get {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let lower = Shape2(d0.start, d1.start)
            let upper = Shape2(d0.end, d1.end)
            return self[lower, upper]
        }
        
        set {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let lower = Shape2(d0.start, d1.start)
            let upper = Shape2(d0.end, d1.end)
            self[lower, upper] = newValue
        }
    }
}

//==============================================================================
// Rank3
public extension TensorType where Shape == Shape3 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int) -> Element {
        self[makeIndex(at: Shape3(d0, d1, d2))]
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2>(r0: R0, r1: R1, r2: R2) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int
    {
        let d0 = r0.relativeTo(0..<shape[0])
        let d1 = r1.relativeTo(0..<shape[1])
        let d2 = r2.relativeTo(0..<shape[2])
        let lower = Shape3(d0.start, d1.start, d2.start)
        let upper = Shape3(d0.end, d1.end, d2.end)
        return self[lower, upper]
    }
}

//------------------------------------------------------------------------------

public extension MutableTensorType where Shape == Shape3 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int) -> Element {
        get { self[makeIndex(at: Shape3(d0, d1, d2))] }
        set { self[makeIndex(at: Shape3(d0, d1, d2))] = newValue }
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2>(r0: R0, r1: R1, r2: R2) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int
    {
        get {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let lower = Shape3(d0.start, d1.start, d2.start)
            let upper = Shape3(d0.end, d1.end, d2.end)
            return self[lower, upper]
        }
        
        set {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let lower = Shape3(d0.start, d1.start, d2.start)
            let upper = Shape3(d0.end, d1.end, d2.end)
            self[lower, upper] = newValue
        }
    }
}

//==============================================================================
// Rank4
public extension TensorType where Shape == Shape4 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int, d3: Int) -> Element {
        self[makeIndex(at: Shape4(d0, d1, d2, d3))]
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2, R3>(r0: R0, r1: R1, r2: R2, r3: R3) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int,
        R3: PartialRangeExpression, R3.Bound == Int
    {
        let d0 = r0.relativeTo(0..<shape[0])
        let d1 = r1.relativeTo(0..<shape[1])
        let d2 = r2.relativeTo(0..<shape[2])
        let d3 = r3.relativeTo(0..<shape[3])
        let lower = Shape4(d0.start, d1.start, d2.start, d3.start)
        let upper = Shape4(d0.end, d1.end, d2.end, d3.end)
        return self[lower, upper]
    }
}

//------------------------------------------------------------------------------

public extension MutableTensorType where Shape == Shape4 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int, d3: Int) -> Element {
        get { self[makeIndex(at: Shape4(d0, d1, d2, d3))] }
        set { self[makeIndex(at: Shape4(d0, d1, d2, d3))] = newValue }
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2, R3>(r0: R0, r1: R1, r2: R2, r3: R3) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int,
        R3: PartialRangeExpression, R3.Bound == Int
    {
        get {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let d3 = r3.relativeTo(0..<shape[3])
            let lower = Shape4(d0.start, d1.start, d2.start, d3.start)
            let upper = Shape4(d0.end, d1.end, d2.end, d3.end)
            return self[lower, upper]
        }
        
        set {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let d3 = r3.relativeTo(0..<shape[3])
            let lower = Shape4(d0.start, d1.start, d2.start, d3.start)
            let upper = Shape4(d0.end, d1.end, d2.end, d3.end)
            self[lower, upper] = newValue
        }
    }
}

//==============================================================================
// Rank5
public extension TensorType where Shape == Shape5 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int, d3: Int, d4: Int) -> Element {
        self[makeIndex(at: Shape5(d0, d1, d2, d3, d4))]
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2, R3, R4>(r0: R0, r1: R1, r2: R2, r3: R3, r4: R4) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int,
        R3: PartialRangeExpression, R3.Bound == Int,
        R4: PartialRangeExpression, R4.Bound == Int
    {
        let d0 = r0.relativeTo(0..<shape[0])
        let d1 = r1.relativeTo(0..<shape[1])
        let d2 = r2.relativeTo(0..<shape[2])
        let d3 = r3.relativeTo(0..<shape[3])
        let d4 = r4.relativeTo(0..<shape[4])
        let lower = Shape5(d0.start, d1.start, d2.start, d3.start, d4.start)
        let upper = Shape5(d0.end, d1.end, d2.end, d3.end, d4.end)
        return self[lower, upper]
    }
}

//------------------------------------------------------------------------------

public extension MutableTensorType where Shape == Shape5 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int, d3: Int, d4: Int) -> Element {
        get { self[makeIndex(at: Shape5(d0, d1, d2, d3, d4))] }
        set { self[makeIndex(at: Shape5(d0, d1, d2, d3, d4))] = newValue }
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2, R3, R4>(r0: R0, r1: R1, r2: R2, r3: R3, r4: R4) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int,
        R3: PartialRangeExpression, R3.Bound == Int,
        R4: PartialRangeExpression, R4.Bound == Int
    {
        get {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let d3 = r3.relativeTo(0..<shape[3])
            let d4 = r4.relativeTo(0..<shape[4])
            let lower = Shape5(d0.start, d1.start, d2.start, d3.start, d4.start)
            let upper = Shape5(d0.end, d1.end, d2.end, d3.end, d4.end)
            return self[lower, upper]
        }
        
        set {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let d3 = r3.relativeTo(0..<shape[3])
            let d4 = r4.relativeTo(0..<shape[4])
            let lower = Shape5(d0.start, d1.start, d2.start, d3.start, d4.start)
            let upper = Shape5(d0.end, d1.end, d2.end, d3.end, d4.end)
            self[lower, upper] = newValue
        }
    }
}

//==============================================================================
// Rank6
public extension TensorType where Shape == Shape6 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int, d3: Int, d4: Int, d5: Int) -> Element {
        self[makeIndex(at: Shape6(d0, d1, d2, d3, d4, d5))]
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2, R3, R4, R5>(r0: R0, r1: R1, r2: R2, r3: R3, r4: R4, r5: R5) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int,
        R3: PartialRangeExpression, R3.Bound == Int,
        R4: PartialRangeExpression, R4.Bound == Int,
        R5: PartialRangeExpression, R5.Bound == Int
    {
        let d0 = r0.relativeTo(0..<shape[0])
        let d1 = r1.relativeTo(0..<shape[1])
        let d2 = r2.relativeTo(0..<shape[2])
        let d3 = r3.relativeTo(0..<shape[3])
        let d4 = r4.relativeTo(0..<shape[4])
        let d5 = r5.relativeTo(0..<shape[5])
        let lower = Shape6(d0.start, d1.start, d2.start, d3.start, d4.start, d5.start)
        let upper = Shape6(d0.end, d1.end, d2.end, d3.end, d4.end, d5.end)
        return self[lower, upper]
    }
}

//------------------------------------------------------------------------------

public extension MutableTensorType where Shape == Shape6 {
    /// - Returns: the element
    @inlinable
    subscript(d0: Int, d1: Int, d2: Int, d3: Int, d4: Int, d5: Int) -> Element {
        get { self[makeIndex(at: Shape6(d0, d1, d2, d3, d4, d5))] }
        set { self[makeIndex(at: Shape6(d0, d1, d2, d3, d4, d5))] = newValue }
    }

    /// - Returns: the sub view defined by the range
    @inlinable
    subscript<R0, R1, R2, R3, R4, R5>(r0: R0, r1: R1, r2: R2, r3: R3, r4: R4, r5: R5) -> Self where
        R0: PartialRangeExpression, R0.Bound == Int,
        R1: PartialRangeExpression, R1.Bound == Int,
        R2: PartialRangeExpression, R2.Bound == Int,
        R3: PartialRangeExpression, R3.Bound == Int,
        R4: PartialRangeExpression, R4.Bound == Int,
        R5: PartialRangeExpression, R5.Bound == Int
    {
        get {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let d3 = r3.relativeTo(0..<shape[3])
            let d4 = r4.relativeTo(0..<shape[4])
            let d5 = r5.relativeTo(0..<shape[5])
            let lower = Shape6(d0.start, d1.start, d2.start, d3.start, d4.start, d5.start)
            let upper = Shape6(d0.end, d1.end, d2.end, d3.end, d4.end, d5.end)
            return self[lower, upper]
        }
        
        set {
            let d0 = r0.relativeTo(0..<shape[0])
            let d1 = r1.relativeTo(0..<shape[1])
            let d2 = r2.relativeTo(0..<shape[2])
            let d3 = r3.relativeTo(0..<shape[3])
            let d4 = r4.relativeTo(0..<shape[4])
            let d5 = r5.relativeTo(0..<shape[5])
            let lower = Shape6(d0.start, d1.start, d2.start, d3.start, d4.start, d5.start)
            let upper = Shape6(d0.end, d1.end, d2.end, d3.end, d4.end, d5.end)
            self[lower, upper] = newValue
        }
    }
}


//==============================================================================
// From tensor to Swift Array<Element>
//
//==============================================================================

//==============================================================================
// Rank1
public extension TensorType where Shape == Shape1 {

}
//==============================================================================
// Rank2
public extension TensorType where Shape == Shape2 {

}
//==============================================================================
// Rank3
public extension TensorType where Shape == Shape3 {

}
//==============================================================================
// Rank4
public extension TensorType where Shape == Shape4 {

}
//==============================================================================
// Rank5
public extension TensorType where Shape == Shape5 {

}
//==============================================================================
// Rank6
public extension TensorType where Shape == Shape6 {

}
