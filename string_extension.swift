extension StringProtocol {
    // str[i]
    subscript(offset: Int) -> Character { 
        return self[index(startIndex, offsetBy: offset)] 
    }

    // str[i..<j]
    subscript(range: Range<Int>) -> SubSequence {
        let start = index(self.startIndex, offsetBy: range.lowerBound)
        return self[start..<index(start, offsetBy: range.count)]
    }

    // str[i...j]
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let start = index(self.startIndex, offsetBy: range.lowerBound)
        return self[start..<index(start, offsetBy: range.count)]
    }

    // str[i...]
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { 
        return self[index(startIndex, offsetBy: range.lowerBound)...] 
    }

    // str[...j]
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { 
        return self[...index(startIndex, offsetBy: range.upperBound)] 
    }

    // str[..<j]
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { 
        return self[..<index(startIndex, offsetBy: range.upperBound)] 
    }
    
    func replaceNew(_ index: Int, _ char: String) -> String {
        return String(self.prefix(index)) + char + String(self.suffix(self.count - index - 1))
    }
}


extension String {
    mutating func replace(_ index: Int, _ char: String) {
        let ind = self.index(self.startIndex, offsetBy: index)
        self.replaceSubrange(ind...ind, with: char)
    }
}
