public import Tagged

#if Quantizer
    import Quantizer
#endif

extension Tagged::Tagged where Underlying: BinaryFloatingPoint {

    @usableFromInline
    internal static func _quantize<S>(_ value: Underlying, in space: S.Type) -> Self {
        #if Quantizer
            guard let quantized = S.self as? any Quantizer::Quantized.Type else {
                return Self(_unchecked: value)
            }
            return _quantize(value, quantizedBy: quantized)
        #else
            Self(_unchecked: value)
        #endif
    }
}
