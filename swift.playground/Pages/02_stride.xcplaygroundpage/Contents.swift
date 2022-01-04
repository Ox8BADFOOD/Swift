//: [Previous](@previous)

import Foundation
import PlaygroundSupport

/*
 /// Returns a sequence from a starting value to, but not including, an end
 /// value, stepping by the specified amount.
 ///
 /// - Parameters:
 ///   - start: The starting value to use for the sequence. If the sequence
 ///     contains any values, the first one is `start`.
 ///   - end: An end value to limit the sequence. `end` is never an element of
 ///     the resulting sequence.
 ///   - stride: The amount to step by with each iteration. A positive `stride`
 ///     iterates upward; a negative `stride` iterates downward.
 /// - Returns: A sequence from `start` toward, but not including, `end`. Each
 ///   value in the sequence steps by `stride`.
 ///
 ///   @inlinable public func stride<T>(from start: T, to end: T, by stride: T.Stride) -> StrideTo<T> where T : Strideable
 */
for tickMark in stride(from: 4, to: 9, by: 2){
    print(tickMark)
}

for i in stride(from: 4, through: 11, by: 2){
    print(i)
}

/**
 /// A type representing continuous, one-dimensional values that can be offset
 /// and measured.
 ///
 /// You can use a type that conforms to the `Strideable` protocol with the
 /// `stride(from:to:by:)` and `stride(from:through:by:)` functions. For
 /// example, you can use `stride(from:to:by:)` to iterate over an
 /// interval of floating-point values:
 ///
 ///     for radians in stride(from: 0.0, to: .pi * 2, by: .pi / 2) {
 ///         let degrees = Int(radians * 180 / .pi)
 ///         print("Degrees: \(degrees), radians: \(radians)")
 ///     }
 ///     // Degrees: 0, radians: 0.0
 ///     // Degrees: 90, radians: 1.5707963267949
 ///     // Degrees: 180, radians: 3.14159265358979
 ///     // Degrees: 270, radians: 4.71238898038469
 ///
 /// The last parameter of these functions is of the associated `Stride`
 /// type---the type that represents the distance between any two instances of
 /// the `Strideable` type.
 ///
 /// Types that have an integer `Stride` can be used as the boundaries of a
 /// countable range or as the lower bound of an iterable one-sided range. For
 /// example, you can iterate over a range of `Int` and use sequence and
 /// collection methods.
 ///
 ///     var sum = 0
 ///     for x in 1...100 {
 ///         sum += x
 ///     }
 ///     // sum == 5050
 ///
 ///     let digits = (0..<10).map(String.init)
 ///     // ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
 ///
 /// Conforming to the Strideable Protocol
 /// =====================================
 ///
 /// To add `Strideable` conformance to a custom type, choose a `Stride` type
 /// that can represent the distance between two instances and implement the
 /// `advanced(by:)` and `distance(to:)` methods. For example, this
 /// hypothetical `Date` type stores its value as the number of days before or
 /// after January 1, 2000:
 ///
 ///     struct Date: Equatable, CustomStringConvertible {
 ///         var daysAfterY2K: Int
 ///
 ///         var description: String {
 ///             // ...
 ///         }
 ///     }
 ///
 /// The `Stride` type for `Date` is `Int`, inferred from the parameter and
 /// return types of `advanced(by:)` and `distance(to:)`:
 ///
 ///     extension Date: Strideable {
 ///         func advanced(by n: Int) -> Date {
 ///             var result = self
 ///             result.daysAfterY2K += n
 ///             return result
 ///         }
 ///
 ///         func distance(to other: Date) -> Int {
 ///             return other.daysAfterY2K - self.daysAfterY2K
 ///         }
 ///     }
 ///
 /// The `Date` type can now be used with the `stride(from:to:by:)` and
 /// `stride(from:through:by:)` functions and as the bounds of an iterable
 /// range.
 ///
 ///     let startDate = Date(daysAfterY2K: 0)   // January 1, 2000
 ///     let endDate = Date(daysAfterY2K: 15)    // January 16, 2000
 ///
 ///     for date in stride(from: startDate, to: endDate, by: 7) {
 ///         print(date)
 ///     }
 ///     // January 1, 2000
 ///     // January 8, 2000
 ///     // January 15, 2000
 ///
 /// - Important: The `Strideable` protocol provides default implementations for
 ///   the equal-to (`==`) and less-than (`<`) operators that depend on the
 ///   `Stride` type's implementations. If a type conforming to `Strideable` is
 ///   its own `Stride` type, it must provide concrete implementations of the
 ///   two operators to avoid infinite recursion.
 public protocol Strideable : Comparable {

     /// A type that represents the distance between two values.
     associatedtype Stride : Comparable, SignedNumeric

     /// Returns the distance from this value to the given value, expressed as a
     /// stride.
     ///
     /// If this type's `Stride` type conforms to `BinaryInteger`, then for two
     /// values `x` and `y`, and a distance `n = x.distance(to: y)`,
     /// `x.advanced(by: n) == y`. Using this method with types that have a
     /// noninteger `Stride` may result in an approximation.
     ///
     /// - Parameter other: The value to calculate the distance to.
     /// - Returns: The distance from this value to `other`.
     ///
     /// - Complexity: O(1)
     func distance(to other: Self) -> Self.Stride

     /// Returns a value that is offset the specified distance from this value.
     ///
     /// Use the `advanced(by:)` method in generic code to offset a value by a
     /// specified distance. If you're working directly with numeric values, use
     /// the addition operator (`+`) instead of this method.
     ///
     ///     func addOne<T: Strideable>(to x: T) -> T
     ///         where T.Stride: ExpressibleByIntegerLiteral
     ///     {
     ///         return x.advanced(by: 1)
     ///     }
     ///
     ///     let x = addOne(to: 5)
     ///     // x == 6
     ///     let y = addOne(to: 3.5)
     ///     // y = 4.5
     ///
     /// If this type's `Stride` type conforms to `BinaryInteger`, then for a
     /// value `x`, a distance `n`, and a value `y = x.advanced(by: n)`,
     /// `x.distance(to: y) == n`. Using this method with types that have a
     /// noninteger `Stride` may result in an approximation. If the result of
     /// advancing by `n` is not representable as a value of this type, then a
     /// runtime error may occur.
     ///
     /// - Parameter n: The distance to advance this value.
     /// - Returns: A value that is offset from this value by `n`.
     ///
     /// - Complexity: O(1)
     func advanced(by n: Self.Stride) -> Self
 }

 extension Strideable {

     /// Returns a Boolean value indicating whether the value of the first
     /// argument is less than that of the second argument.
     ///
     /// This function is the only requirement of the `Comparable` protocol. The
     /// remainder of the relational operator functions are implemented by the
     /// standard library for any type that conforms to `Comparable`.
     ///
     /// - Parameters:
     ///   - lhs: A value to compare.
     ///   - rhs: Another value to compare.
     @inlinable public static func < (x: Self, y: Self) -> Bool

     /// Returns a Boolean value indicating whether two values are equal.
     ///
     /// Equality is the inverse of inequality. For any values `a` and `b`,
     /// `a == b` implies that `a != b` is `false`.
     ///
     /// - Parameters:
     ///   - lhs: A value to compare.
     ///   - rhs: Another value to compare.
     @inlinable public static func == (x: Self, y: Self) -> Bool
 }

 extension Strideable where Self : _Pointer {

     public static func + (lhs: Self, rhs: Self.Stride) -> Self

     public static func + (lhs: Self.Stride, rhs: Self) -> Self

     public static func - (lhs: Self, rhs: Self.Stride) -> Self

     public static func - (lhs: Self, rhs: Self) -> Self.Stride

     public static func += (lhs: inout Self, rhs: Self.Stride)

     public static func -= (lhs: inout Self, rhs: Self.Stride)
 }
 */
//: [Next](@next)
