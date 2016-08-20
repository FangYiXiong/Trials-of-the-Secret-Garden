import Foundation

enum setType: Int {
  case setMain    = 0
  case setBuilder = 1
}

struct tileMapLevels {
  
  static let MainSet: [[[Int]]] =
    [
      [
        [2,2,2,2,2,2,2,2,2,2],
        [1,1,1,1,1,1,1,1,1,1]
      ],
      [
        [1,1,1,1,1,1,1,1,1,1],
        [1,1,1,1,1,1,1,1,1,1]
      ]
    ]
  
  static let BuilderSet: [[[Int]]] =
    [
      [
        [1,1,1,1,1,1,1,1,1,1],
        [1,1,1,1,1,1,1,1,1,1]
      ]
    ]
}