#if Scale
    public import Scale
    public import Tagged

    @inlinable
    public func * <let N: Int, Space, Scalar: FloatingPoint>(
        lhs: Measure<N, Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Measure<N, Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <let N: Int, Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Measure<N, Space>.Value<Scalar>
    ) -> Measure<N, Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func / <let N: Int, Space, Scalar: FloatingPoint>(
        lhs: Measure<N, Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Measure<N, Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Area<Space>.Value<Scalar>,
        rhs: Area<Space>.Value<Scalar>
    ) -> Scale<1, Scalar> {
        Scale(lhs.underlying / rhs.underlying)
    }

    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Displacement.X<Space>.Value<Scalar>,
        rhs: Displacement.X<Space>.Value<Scalar>
    ) -> Scale<1, Scalar> {
        Scale(lhs.underlying / rhs.underlying)
    }

    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Displacement.Y<Space>.Value<Scalar>,
        rhs: Displacement.Y<Space>.Value<Scalar>
    ) -> Scale<1, Scalar> {
        Scale(lhs.underlying / rhs.underlying)
    }

    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Displacement.Z<Space>.Value<Scalar>,
        rhs: Displacement.Z<Space>.Value<Scalar>
    ) -> Scale<1, Scalar> {
        Scale(lhs.underlying / rhs.underlying)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Displacement.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.X<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Displacement.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.X<Space>.Value<Scalar> {
        ._quantize(lhs.underlying * rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Displacement.X<Space>.Value<Scalar>
    ) -> Displacement.X<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Displacement.X<Space>.Value<Scalar>
    ) -> Displacement.X<Space>.Value<Scalar> {
        ._quantize(lhs.value * rhs.underlying, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Displacement.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.X<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: BinaryFloatingPoint>(
        lhs: Displacement.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.X<Space>.Value<Scalar> {
        ._quantize(lhs.underlying / rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Displacement.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Y<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Displacement.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Y<Space>.Value<Scalar> {
        ._quantize(lhs.underlying * rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Displacement.Y<Space>.Value<Scalar>
    ) -> Displacement.Y<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Displacement.Y<Space>.Value<Scalar>
    ) -> Displacement.Y<Space>.Value<Scalar> {
        ._quantize(lhs.value * rhs.underlying, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Displacement.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Y<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: BinaryFloatingPoint>(
        lhs: Displacement.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Y<Space>.Value<Scalar> {
        ._quantize(lhs.underlying / rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Displacement.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Z<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Displacement.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Z<Space>.Value<Scalar> {
        ._quantize(lhs.underlying * rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Displacement.Z<Space>.Value<Scalar>
    ) -> Displacement.Z<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Displacement.Z<Space>.Value<Scalar>
    ) -> Displacement.Z<Space>.Value<Scalar> {
        ._quantize(lhs.value * rhs.underlying, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Displacement.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Z<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: BinaryFloatingPoint>(
        lhs: Displacement.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Displacement.Z<Space>.Value<Scalar> {
        ._quantize(lhs.underlying / rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Extent.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.X<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Extent.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.X<Space>.Value<Scalar> {
        ._quantize(lhs.underlying * rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Extent.X<Space>.Value<Scalar>
    ) -> Extent.X<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Extent.X<Space>.Value<Scalar>
    ) -> Extent.X<Space>.Value<Scalar> {
        ._quantize(lhs.value * rhs.underlying, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Extent.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.X<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: BinaryFloatingPoint>(
        lhs: Extent.X<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.X<Space>.Value<Scalar> {
        ._quantize(lhs.underlying / rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Extent.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Y<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Extent.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Y<Space>.Value<Scalar> {
        ._quantize(lhs.underlying * rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Extent.Y<Space>.Value<Scalar>
    ) -> Extent.Y<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Extent.Y<Space>.Value<Scalar>
    ) -> Extent.Y<Space>.Value<Scalar> {
        ._quantize(lhs.value * rhs.underlying, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Extent.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Y<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: BinaryFloatingPoint>(
        lhs: Extent.Y<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Y<Space>.Value<Scalar> {
        ._quantize(lhs.underlying / rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Extent.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Z<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Extent.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Z<Space>.Value<Scalar> {
        ._quantize(lhs.underlying * rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Extent.Z<Space>.Value<Scalar>
    ) -> Extent.Z<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Extent.Z<Space>.Value<Scalar>
    ) -> Extent.Z<Space>.Value<Scalar> {
        ._quantize(lhs.value * rhs.underlying, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Extent.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Z<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: BinaryFloatingPoint>(
        lhs: Extent.Z<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Extent.Z<Space>.Value<Scalar> {
        ._quantize(lhs.underlying / rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Magnitude<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Magnitude<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying * rhs.value)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Magnitude<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Magnitude<Space>.Value<Scalar> {
        ._quantize(lhs.underlying * rhs.value, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func * <Space, Scalar: FloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Magnitude<Space>.Value<Scalar>
    ) -> Magnitude<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.value * rhs.underlying)
    }

    @inlinable
    public func * <Space, Scalar: BinaryFloatingPoint>(
        lhs: Scale<1, Scalar>,
        rhs: Magnitude<Space>.Value<Scalar>
    ) -> Magnitude<Space>.Value<Scalar> {
        ._quantize(lhs.value * rhs.underlying, in: Space.self)
    }

    @_disfavoredOverload
    @inlinable
    public func / <Space, Scalar: FloatingPoint>(
        lhs: Magnitude<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Magnitude<Space>.Value<Scalar> {
        Tagged::Tagged(_unchecked: lhs.underlying / rhs.value)
    }

    @inlinable
    public func / <Space, Scalar: BinaryFloatingPoint>(
        lhs: Magnitude<Space>.Value<Scalar>,
        rhs: Scale<1, Scalar>
    ) -> Magnitude<Space>.Value<Scalar> {
        ._quantize(lhs.underlying / rhs.value, in: Space.self)
    }
#endif
