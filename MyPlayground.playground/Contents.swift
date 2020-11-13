import UIKit

struct Resolution {
    var width: Int
    var height: Int
}

func    test(testStruct: inout Resolution) -> Resolution {
    testStruct.width = 50
    testStruct.height = 50
    return testStruct
}

var test = Resolution(width: 10, height: 10)
print("orig: width= \(test.width), height=\(test.height)")
test(testStruct: &test)
print("chan: width= \(test.width), height=\(test.height)")
