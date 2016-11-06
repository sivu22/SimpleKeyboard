import Foundation


internal func identityAsString(value: AnyObject?) -> String {
    if let value = value {
        return NSString(format: "<%p>", unsafeBitCast(value, Int.self)).description
    } else {
        return "nil"
    }
}

internal func classAsString(cls: AnyClass) -> String {
#if _runtime(_ObjC)
    return NSStringFromClass(cls)
#else
    return String(cls)
#endif
}

internal func arrayAsString<T>(items: [T], joiner: String = ", ") -> String {
    return items.reduce("") { accum, item in
        let prefix = (accum.isEmpty ? "" : joiner)
        return accum + prefix + "\(stringify(item))"
    }
}

#if _runtime(_ObjC)
@objc internal protocol NMBStringer {
    func NMB_stringify() -> String
}

extension NSArray : NMBStringer {
    func NMB_stringify() -> String {
        let str = self.componentsJoined(by: ", ")
        return "[\(str)]"
    }
}
#endif

internal func stringify<S: Sequence>(value: S) -> String {
    var generator = value.makeIterator()
    var strings = [String]()
    var value: S.Generator.Element?
    repeat {
        value = generator.next()
        if value != nil {
            strings.append(stringify(value))
        }
    } while value != nil
    let str = strings.joined(separator: ", ")
    return "[\(str)]"
}

internal func stringify<T>(value: T) -> String {
    if let value = value as? Double {
        return NSString(format: "%.4f", (value)).description
    } else if let value = value as? NSData {
#if os(Linux)
        // FIXME: Swift on Linux triggers a segfault when calling NSData's hash() (last checked on 03-11)
        return "NSData<length=\(value.length)>"
#else
        return "NSData<hash=\(value.hash),length=\(value.length)>"
#endif
    }
    return String(describing: value)
}

internal func stringify(value: NMBDoubleConvertible) -> String {
    if let value = value as? Double {
        return NSString(format: "%.4f", (value)).description
    }
    return value.stringRepresentation
}

internal func stringify<T>(value: T?) -> String {
    if let unboxed = value {
       return stringify(unboxed)
    }
    return "nil"
}
