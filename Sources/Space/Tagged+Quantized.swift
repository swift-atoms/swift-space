#if Quantizer
    public import Quantizer
    public import Tagged

    extension Tagged::Tagged where Underlying: BinaryFloatingPoint {

        @usableFromInline
        internal static func _quantize<Q: Quantizer::Quantized>(
            _ value: Underlying,
            quantizedBy space: Q.Type
        ) -> Self {
            do {
                let grid = try Quantizer<Underlying>(quantum: Q.quantum(as: Underlying.self))
                return Self(_unchecked: try grid(value))
            } catch {
                preconditionFailure("Spatial quantization requires a valid grid and representable finite value: \(error)")
            }
        }
    }

    extension Tagged::Tagged where Tag: Spatial, Tag.Space: Quantizer::Quantized, Underlying: BinaryFloatingPoint {

        @inlinable
        public var ticks: Int64 {
            do { return try ticks(as: Int64.self) } catch { preconditionFailure("Spatial ticks do not fit Int64: \(error)") }
        }

        public func ticks<T: FixedWidthInteger>(as type: T.Type) throws(Quantizer<Underlying>.Error) -> T {
            let grid = try Quantizer<Underlying>(quantum: Tag.Space.quantum(as: Underlying.self))
            return try grid.ticks(for: underlying, as: type)
        }

        @inlinable
        public init(ticks: Int64) {
            do {
                let grid = try Quantizer<Underlying>(quantum: Tag.Space.quantum(as: Underlying.self))
                self.init(_unchecked: try grid.value(at: ticks))
            } catch {
                preconditionFailure("Spatial tick conversion requires a valid grid and finite result: \(error)")
            }
        }
    }
#endif
