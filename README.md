# swift-space

Use this package when single scalar quantities in a coordinate space must not be confused: a position on one axis versus an offset along it, one axis versus another, one frame versus another, a length versus an area. Every value is a `Tagged::Tagged` whose tag carries the role, the axis and a phantom `Space`. Start from `Coordinate.X<Space>.Value<Scalar>`, `Displacement.X<Space>.Value<Scalar>`, `Extent.X<Space>.Value<Scalar>` and `Measure<N, Space>.Value<Scalar>` (`Magnitude`, `Area` and `Volume` are `Measure` with `N` of 1, 2 and 3). For whole points, vectors, rectangles and transforms built from these values, use swift-geometry instead.

## Laws

- Coordinates and displacements form an affine space: `start + (end - start) == end`. With integer scalars this holds exactly.
- No value is constrained in sign. `Extent` and `Measure` values may be negative: `width` of a negative displacement is a negative extent, and the cube of a negative length is a negative volume. `sqrt` of a negative area yields NaN; it does not trap.
- Quantization applies only to `BinaryFloatingPoint` scalars whose `Space` conforms to `Quantized`, and only when the `Quantizer` trait is enabled. Otherwise every value is stored exactly as computed.
- In a quantized space the value is snapped to the nearest point on the space's grid by `init(_:)`, by every operation that yields a `Coordinate` (adding or subtracting a `Displacement`, `Magnitude` or `Extent`, and the compound assignments), by coordinate minus coordinate, which yields a `Displacement`, and by multiplying or dividing a `Displacement`, `Magnitude` or `Extent` by a `Scale`. Other operations do not re-quantize: sums and differences of displacements, magnitudes, extents and areas, products, `sqrt`, negation, `abs`, `.zero`, `width`, `height` and `depth`. `Tagged::Tagged(_unchecked:)` never quantizes.
- Quantized values are canonical: each tick has exactly one bit pattern. Accumulating steps and adding the total once give the same bits, and a compound assignment gives the same bits as the operator it abbreviates.
- Equality and hashing compare the stored scalar, not the tick, and agree in concrete and generic contexts. Two values on the same tick are equal because quantization stores them identically; two off-grid values on the same tick may still be unequal.
- Ticks have no implicit machine bound: a quantized value may lie outside the `Int64` range. `ticks(as:)` throws when the tick does not fit the requested integer type.
- In a quantized space these conditions trap: an invalid grid, or a value that is not finite or cannot be represented (in `init(_:)`, `init(ticks:)` and every quantizing operation), and a tick that does not fit `Int64` (in `ticks`).
