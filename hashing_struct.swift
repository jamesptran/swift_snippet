// Using struct with hashable properties
struct Coord: Hashable {
  var x: Int
  var y: Int

  init(_ x: Int, _ y: Int) {
    self.x = x
    self.y = y
  }
}

var d: Dictionary<Coord, String> = Dictionary()

d[Coord(1, 2)] = "Hello"
print(d[Coord(1, 2)] ?? "") // Print Hello


// Using hashable struct with a tuple and defining custom hash function
struct Pair<T:Hashable,U:Hashable> : Hashable {
  let values : (T, U)
  
  func hash(into hasher: inout Hasher) {
    let (a,b) = values
    a.hash(into: &hasher) 
    b.hash(into: &hasher)
  }
  static func ==<T:Hashable,U:Hashable>(lhs: Pair<T,U>, rhs: Pair<T,U>) -> Bool {
    return lhs.values == rhs.values
  }
}

let pair = Pair(values:(1,2))
var pairMap = Dictionary<Pair<Int,Int>,String>()
pairMap[pair] = "World"
print(pairMap[pair] ?? "") // Print World
