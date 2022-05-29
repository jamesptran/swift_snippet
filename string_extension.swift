extension String {
    func replaceNew(_ index: Int, _ char: String) -> String {
        return String(self.prefix(index)) + char + String(self.suffix(self.count - index - 1))
    }

    mutating func replace(_ index: Int, _ char: String) {
        let ind = self.index(self.startIndex, offsetBy: index)
        self.replaceSubrange(ind...ind, with: char)
    }
}
