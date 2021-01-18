//
//  PuzzleInput.swift
//  AdventOfCodeDay24
//
//  Created by Vincent Snow on 1/17/21.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}

protocol IntPairConvertible {
    init(_ pair: (Int, Int))
}

struct IntPairStruct: Hashable, IntPairConvertible {
    let int0: Int
    let int1: Int
    
    init(_ pair: (Int, Int)) {
        self.int0 = pair.0
        self.int1 = pair.1
    }
}

extension Dictionary where Key: IntPairConvertible {
    subscript (key: (Int, Int)) -> Value? {
        get {
            return self[Key(key)]
        }
        set {
            self[Key(key)] = newValue
        }
    }
    subscript (key0: Int, key1: Int) -> Value? {
        get {
            return self[Key((key0, key1))]
        }
        set {
            self[Key((key0, key1))] = newValue
        }
    }
}

let input = """
swswswswneswswwwswnewswswweswnwsww
nwwewenenwnenwnwnwnwneswnwswnwnwswswnw
seneswwwswwnenwnenwswswswswsewseeww
esenesenesesesewseseswnesesweesesesese
seseseeseenesewseenwsesewswwsesenwse
eswenewnenenewneneneneenenenenwnene
nwseeseseeseseseseewseesenwseeesese
nwnwswswswweneseswwswwneswswswswswsw
senenenwnenewneneneseswneeeenenenew
eswnwnesenwnwnenwnwnwnwwnwsenwwswswenw
wswneswswseesewswseswswswnenesenenwswswne
seswseswneswswswwnwswwswseneswswswswsee
neseseswnwesesesesewswsesenesenesesesw
wwswwwsweswwwww
seswwnwneenwswneenwewneneneseenee
eswseenweswewseneeeeseeswnwnwse
swsweswswswnweswswneswwswnwswwwswswswsw
nwwnwnwnwnwnwnwnwwswwnweneswwenwnw
sewswwwwwwwweswwwwneswwnwswnw
nwneeneeneneseneseneneneneneneswnenwnene
swnenenweeneeeseswweneenenenenene
nwnwnwsenwewsesenwenwwwswwnwnesenw
swnwswswswswswsewseswnewneseswswswneesw
wwweswwswwsewswswwwwnwwesewwne
swswsweneswswswenwswnewnwswwneswseswswe
nwnesewwnwwnwwwsew
enwwwnenwnewwwwswwseeswewe
neswseswswsenwseswnwseswse
senwseneneneneneeseneswnenenenenwnenwnw
swseneswwseenwsenwneneswnewnenewene
ewwwwwwwewwwnwswwwwwwwne
eswswenwsenwnwsenenw
nwneseewseswwsewswnwnwnwwwwnewww
nwwwwwwwwewnwwswnew
neeeseeesewseeeeeeeewe
wweswnenwwnewnwnwwwewsewnwwsew
swwswwwswwewwswswnwsweswnwwwww
eseswneenwneenweseenweeseeeenw
neneswneneneneneneneneneswnenwnwnw
nwnwwnwewwswwnwwwnwsewnwwenwnw
seswswswnwswwwwswwswneswwseswnw
nwseswenwwneneneseswneenwnenenwnenwnenw
nwnenenenesewwnenwnwnesenwnwnwnwnenwnwnw
wseeeneseeeseseesesenwseseswsesese
sweseswnwseseseswseswseseseswswswse
ewwwswswsenwewnewwwenwwwnwww
nwwsewnwnwnwneswwnwesewnwwnwnwnwnwne
nenwnwnwnenenwnenwnwswswnwneenenwnwnwne
esenwneswsesesweeeeweseseeseseswnw
swswswswwsesweseswswswsw
swsweneswwseswswswwswsenewswwswseswnene
nenenewnwnenenwenwnesenwneseswnwnwnwne
nenenenewneeseneneswneneneswsenenenwne
nenenwnenwswwnweesenwsenwnwnwseswnwnwnw
seseeenwsenwswsesenwseeseeseeseswese
swneeseseneswswnwswnwwwwswswnee
seeseseseneseseswsewseenenwwneseswse
wswseseenwwswnewenwswswwwnewwsw
nenewswnwnenwnwneeneswseeneswnenwnenesene
nwswsenweweseeneseesesesesesesesee
seneswswwesenenwswseswnwseseseseseswne
wwnwwweswnwnwwweneseewnwsesenw
swswneneneneenewnesenewweenweswne
eseneseneseenenewwswseweenweenenene
nwwnwwnwsenwnwnwnwwnwwnww
swweswsewewwwwwwwwwwnewne
swswnewseseseesenewseesesesesesenwese
swswnenwnenwnwnwnwnenenenwnwwnenwseene
wnwwwwnwnwwnwwnwnwwwnwnwsenwe
nwseswwwnenwwwwesewwwwwwwnenwnw
nwswswnwswwswwnenenwnwnwnwnewnenw
seswswswnwswswswswswswswswswswswsw
neneseeneswnwnenwnwsenwnenenewne
wwwwwnenwnwnweswwnwsewwwesese
swwswswwwwseswswenwnewswwswweswnw
swwswseswswseeswswswewswswnwswswese
nwnwewsenenwnesewwwwswnwnenwswsee
seseseenwwswseneneseswswnwnewswnwsenwse
wwswwnwwwwsewwwenewnwswnwwwe
swwwwswwswwswneseswswswwnewswwse
nenenwneeswnenesweneneneeneneswsewesw
seswswswseswswswswsweenwswswwseswwsw
swswswsewneseesenwseseswseswswswnwsesw
nwwnewnwnwswnwnwswnwsenwwnwenwnenww
wswwnwwwswwwwswe
eewneeeeneeswsee
wseneseeseewseseseswsewse
wwswnwnwwnewnwsewenenwswwewswwne
seneesesesesewswswwnwseswswseseswseswsw
ewnweeeseneseeseseeneseswwwee
wwwwswwsewwwwewwwwwswnwwne
swsewswswswseswseseeswsenwseswswswsenw
nenenenenesenenenenenenewenewneswsene
newnewewwnwnwnwsewwswnwwwwesww
neseeeneneeewnee
wsenwwnwenwnwwnwnwnwwnwnwwnw
nweswenwseseswwseeenwseenwswsesewsw
wwwswwwwsewwwwwwwwne
nenwnwnwnenwnwnwnenwwnwnwnwnwnwe
eeeeeweneeseeeesweeeeew
seneseeeeewewnweseeseseseeseese
swenenenenwesweewneeeneneeeeeee
wnenwseswnwwwsenwnwwnwnwwnwwnwnwnwnw
sewwwswnwwnwwwswwnewwewwwsw
swwwwswswwswswwwswnew
esweeneeswenwnweesweneeeeswee
eenweeseneeeeeeeeeseeenenwsw
nwneswweeneseswnwswnweeesesesenwe
neneneeswnwnwnwnenenwnenene
wseewseeseseneswsenwsenewsesweseswswse
eseswneneseneenenewswwnwnenenesenenenw
seswsesesweseswseswseswwsw
nwnenenenenwnenenwsenenwwsenewnenenene
eneneneneswnenenenenenenenwneneneswnwnw
neneeneneenwnenenesweneneewsweneene
swnwnwneswnwnwseenwnwnenwenewnwnwnwwnw
swswwnwwswnwwseswewswneseneswewneswe
neswswnewwswswwwswwsewww
nwneeenwswnwsenwnwnwnwnenwswnwnwsenwnw
neeswnwnwwnwseswesweneswnw
swnenwenwnwnwnwsesenwswnwnwnwnwnwnwnwnw
swseswswnenwwwwseswwwwsw
seswneseswseswswswsewesenwsenesewsesw
eseeneswseenwewseewneeeene
swnenenenenenenewwneneswnenenesenesenw
swnenwnenwnwenenenwnenenwnwnene
eswneenwwnwwwneewneneneswneseswee
neseneseneewneeeweewnwneeseee
nesenenenenwnwnenwswnwnenwnenenwnw
seswsesesenwseeeeseseeesesewseenw
eneswsewneeswnenweswneeswnewwswseene
eeseseseswneswseseeeeeeeeewne
wwwseswnenwwnwnwenenwnw
sesenesweeeeeweeeweeenwwe
wsewnwwsewwewwnew
esesenwnwwwneswwswsenwnwnwseswneswwew
nenwwnwnwnwswwenwwwenwwwnwnwwnw
seeeneeneeseeswnenenwsweweewee
swswswwswswswswwswswwswneswswsw
nweseneweseeswwnwwswswnw
wnwsweswseswswswswseswne
swnenenwneenenenenenenenenenenenene
swswswswswseswswwswswswwnwwenwnwseswesw
wswwswswwswswsweswewswwswnwnesw
neneeewneneeswnewneneeseseswewnw
seseswseeesenwsesweseneseeseeesese
nenenenwnesewneswneneseneenewnene
neneneneneneswwneneneneneesenenenenene
swswswnwswnwswsweeswswseswswswswswswnw
sweeseseneeeseeswnewnwnwwewsee
neswsenwnewwnwwwwwwswweseenenww
nwwwwnwwwsewnwwswnewwwnewww
nwswsweswswneswseswswswswwneseswwnesww
wsewwnwwwwswnewwwwsewswwwsw
nwwwwwsenewneewwseenewwsesw
nwnenwwnwwnwwnenenwnenwenesenwenwne
nwnenwnwsewnenwsenwnenenwnwnenenenwnene
wswswwwenwswenesewwnenwe
wseswneeswneseenwnwsenwswewwweswesw
swnwseseeeeewseswnwseneseswsenwsesene
sweneswnwnwswsweneswnwswneswneswsweswsw
eeeswnwswneeneenewswnewneneeee
senwwnenwenwnwwsenwnwnwnenw
esesenweseeeeseseeesesese
seeeeseneseseeeswseeeeseewsene
wneswwwwswswwwewwnesesenwwwse
wnwnwwwsenwnwswnwnwnenewnwnwwnwwnw
senewsesesesesesesesesesesese
eenweswneeenee
nwnenwwnwnwnwnwwwseenwnwnwwnwnwnwswnw
esweneseeneeneeneneneneneswnenewnee
nwwwwswwewnwnwww
neneeneewneeneneneswnwnesenenenenwnesene
wneswsesenewswwwwwwwnwswwwseww
wesenesewswsenwswneswswseswneesesese
sesesenwswsewnwsenwswseswesenenwseeseew
wwnwswwneswwweswwwwwwwswww
nenenwnesewwswswewsenwswnewwswew
wwwnwwwnenwwwwwnwswnwnw
nenwswneneneenenenenwnenwnwnwnenwnw
swenwswewswswswewnwwswnewswseswne
swsenweeseswenwseseswsenwsesewseswswse
eeeweswnwnenenweeswneeeseneeee
swwswneseswnwseneswnewswweseswnwww
swswswswnenwswswseswseswswswneswwseswsw
enwsewsweeseseseneweeseswesenwese
nesenweneneneneneswnwnwnenwnenwnenwnene
seswseeenwsesenweseseseseseneseeseeswse
senenwsewnwnwnenwewnwswwneswnwnwsweenw
neeewnenweseseseeswnesweneneewwse
eeenwswswseneweseneenweneneneew
swswneneswnenenenwnenwnenenenwnwnwwnwe
swsweswwswswswwnwwwweswswswwswnw
wewwewwwwnwswswwwwswwswsww
swwnwwswnweseswnwswseweenewwww
neswswswseswswseswswswseswwswswswsesenw
eneeneneneewneneneeneneenesew
nwnwnwnwnwnwnwsenwenenenwnwnwnwwnwnwswne
weneswnwsenewseseswseeseene
eseseweneenwnweseeseseneneweswswe
swswswswseswswsenwnwseswseeswswsweswnw
sweswwsweswswwswswsweswswwnwswnwenw
eeeseseeenwsewswesesewsenwsenesw
seneswseseseseneseseseweesesesw
ewnwnwwnenwwnwwnenwwnwsewwnwswww
senweeswseswneweesesesesewnwnwsee
wseseseseseseeneseese
neswneswewnwswwwwwwwswwwseewnwse
sewwsesesewnwswswswseeneeesesewse
sweswwneseneswswswswnwswnesene
eesweeenenweeneeeswenwneeeene
eseseeneweeseeeeneenwneeenwne
neneneneneswneenenwnewneneneneswnenenenee
nwnesewwswswseswnwwneswswwswwsesesw
eeneeswesenwewenwneneeeseenwesw
nenwneneneneswnenenenwnwnenw
wwseewnewwneenwwnwswsewseenwse
wsenwwnwwswwwwwswnweewnenwsee
nweseswseseseeeseeseeseeesenwsese
neneswseesewesenenenwneswwswnewswswsenw
wwneseenwwsenwnwnwneswswewnwswwnwne
eneneeneneeneesw
nwnenenwenwnwseeenwwswnwnenwnenewnw
swsweswswsewewswswnwnwwsewwe
swseneswswswswswswsesewswswseseswswnesw
eseseesenwsenwseseeeweesesweeene
neswnwsewsweseswseseswsesesenwnwneseseswse
eeneeeseeseenwneeneeeeeewne
nenwswewnwsweneswwenwswneseseneenew
weeswwwwnenwswnwsenewnwswwnwnwenw
wwnewswswswwnwseswwwswswwwnwsew
newsenwwneswwnwwnwswseeswseswsenwww
swswwsweneswwwnwnee
nwswswswswswswswswnwnwswenwseswswseeswsw
nwnwnwnewswwswnwnwnenwsenweenwnwnwnese
nwenwseseseswswswswswswenwseswnwewswswse
swneswwewsenwnwnweeenenweeseese
nwwwwwswnwesenwwnee
nwnwwwwnwwnwnwsenw
nwseseseswswneseswswnwseseswsweswsweswsw
enweswnweswnweneeeneneneeeswee
sesenwseswnwswswnenesesesesweseseesesw
swseswsewnwnwwneswswswseswswneseswwsw
nenwnenwnwnwnwnesenwnwnwnwswnene
swwenweesenesweesenweseeeeee
swnewsesenwswesweeneneesewnw
swneweswsenwnenesese
nwnweseeseseseswseewseseenenwsee
neswswneseeeeenenwwneeenenwneseneene
swswswsesesesenwsesesenwseswsesese
nwswnwenwnwnwnwnwnwnwnwnwnwsenwnw
eeneesweeeeeeseswnweeneneewe
eeenweseseeeswnwwnwnenwswnewsenenw
neswswswswseseesweswsenwsesenwnwswswsesew
eseeeseenweseeeeseese
swwwswwswwswwsewwswswnwsww
swswwsenwswwswswswswwwswew
eeeseeeseswewneeswneee
sweseswswenwnwwswswnwnenwwseewwwsee
wwnwwwwnwnwwwwewwenewnwswww
sewneswnwseeneswwwnewnwenewseswwnw
seswswswswwswswswnwsweswswswswseswswe
seswswswswswnwneswnwswswsesesenese
eenweseeeseeeeneneeeweseesw
swnwseswswnweneswenwnewenenwnwswnenese
wweenewnwsewnwwnwnenwswseweesw
wwseneeneneneneseenwwswsewwesee
wwsenewwswswwwswwwwswsw
nwwswwwnwwwnenwnwwnwnenwwswwnesw
eneseeweseesesesweewnwenwwswe
eneneeeweneeseeeenesenenenwne
neeneeeeesweseweeeeeewee
swsewnesenweenwenwnwneseseswnwnenene
sewseswseseswseseseswswesenwneswsesese
nwwwnewsewswswwnwseewwwsenewne
enwneseeeeswswneeenwnweeewwsw
wnwswswswswswsweswsw
nenenenwnesenwnenwnwswwswnene
swseseseseenwesenwsesewseesewnwseenw
eswenwsweeeenwneswseeeenwwnee
sweeswswwswswnwwnwswseseeswsesw
nweenwswsesenwneswnweeeeseseswswsenw
wnewseenwnwswneseeeeswnenwneene
nwsewnwnwnenwnwnwswenwnwnwnwwnwnwnwse
swswswswswswswnwswswswswseeswnwseswswsw
senwseswseeseneseewnwnweeseesesesesese
eeseeeenweeeneeeeneeeew
seswsenwswseesesenwswsesweswneseswsesese
nwwnenwnwwwnwwwsenwwnwnwsewnwnewsew
swneswswswswnwwswswswseswswsweswseenw
swwnenwnwneneenenenwnenwnenenenwnwne
ewneswsenwnwenenenwswseeesewnwsww
wswswenwwnenwnwseeswwnweswswnweeswse
nwnwnwsewnwnwnwenwswwsewnwenwnwwnw
neneswneneneneneneeneenenwnenewnwneenesw
eeeseseeweeeeenee
nwnwnwswsenenwenwnwnwnwswnwnwsenwnwsweene
wwsewwwwswwnewwnewwswwswwsw
nesesewwneseneseweeenwsweenwswwse
eeenweesweeewweeeeneeeee
eseswnwwsenwswneswsesweseneeneneswwwsw
wnwnwnwnwewnwnwseenwwnww
enwsenwseseeneseeseseseeswnwseesesee
neneseseseeswswwseswnesesewswnwnwwee
neenwnwnwnenwsenwnwnwsenwnenenwnwneneswnwnw
senewnwnenweeewnenwnenenwswnwnenwswnwne
seseswseswsesesesesenesewseesesesesew
nenenenwwnwneeneenwswnwnenwnwnenewnee
wwwwwseswneewnewneswnwewswsenw
nwnenwnwnwnwenwnwnenenwnwsenwnwwwnwne
wswwsenewnenenesewneneseseseewnewsw
nwnwsenwnwnwnenwnwnwnwnwnwnwnw
nwswswnwnenenwenenewneeeneswswnenwwnene
sesenwnwenwnwwnwnwnwnwnwnwnwsenwneswsenw
nwneneneswnenwnwnwnenenwnenwsenwnene
seneswneewswnenwwneeeeneeneneewe
seswswswswswneswswswswwweswwswnwswwne
swnenwnwwnenwnwnwsenenwweesenenenew
swsewwnenwnwwwwsenwwwewnwwsenew
eeeeeneeneeweneeeneenwnewswene
nwnwnwnwwnwwwwnwwwwnewnwwswneswe
swwnwsweneseswwswnewswswnwswseswnwseswe
swswswswswswswswswswseswswswswneewnwww
senwnenwsenenewnwnwwsenenwnwnwnwenenw
wswnwenwenewnwwwwwnwnwwswwwsw
swseseswswseswseneswwseneseswwseswsesese
eeeswsenewenweseeeeseeeenesw
enwnenwneswwewnwsewnwnenenwnwse
nwnenwnenwenwnwnenwnwnwswnwnwnwneneswnw
sweswseswswnwswswswswswswseenwswsewsw
wnwnwewnweenwnwewnwwsenwweswnw
senenwnwwnwnwnwwnwwwnwnwnwnwnwnwnwsesw
nwnwnwneswnwnwenwnwnewnwneenwnwnwswne
seesenewnwneswnenenenenenenenesewnene
seswwswnenwnwseseswseswswswseseweneesw
swwswenwwnwnwwewwwnwwnwnwwe
nwnwnenenwnwsenenwnwsenwnwswnwnwnwnwnw
wewsesenwswnewnwnwwnw
nesenenewneesenenweneweneeneeneeswne
senwwsenwswswnwneesewwnwneenwwnwswe
nwnwenwnwnwswnwnwnwnwnwswnwnwwenwnwnwnw
nwnwnwswnwnwneewnesenwnwnwnewnenwnenwnwe
wseseenwswseneseseneeeseeeeesenw
nenewwsewwenenwwsewswwnwwswww
nwwwnwwnesewewwwwswwewwseww
eeswseneswwsenwesesweswwsenwnwnwnese
wnwwswwewwwwwwwsenwnwwnwwsenw
nwnwnwnwnwneseneenwnenwwneenenwnwwnw
nwnwsewswnesenenwenweneseeneswwnenwwne
nwseeneneneneeneneneneneswwwwewswse
nwnenwnenenenwwswneneswnwneneneeenenwne
swswswsweswnwwswswswsweswneswswswswsw
seswseseswseswseswswnwseswswswseneswew
senwwwweswnwneswenwwswnwnwnenwwse
swswswswsewseswsewsesesesweneswsesesw
enenewneneneeeewneneseeneeneseene
nwnwnwnwnwwsenwnwsenwnwsenwnwwnwnenwnwnesw
nenenenwswnwneneneneneneneenwsenenenenw
nwnenwnwnwnwnwenwnwnwswneswnwnwnwnwnwsenw
neenenwseswnwseswswnwwnenwnwnenenenwswsew
sewnenwnenwenesenwwnwsenenwwne
wswnwwswwnwnwnwnenewnwnw
senwswneeswswswswwwswswswwsweswwsw
esewswneeeeneeewneneneneseenenwnene
nenwnwwneswnwswnwnenwswnwnwsenenwnenwnwnw
wswswnwswswwswnwswwsweweswswswsw
swswenewweswwwsweewwseswwnwnw
swwwseswswwsenesweesweenwnewsese
eseeseneseewsweneeeeseeeeee
wwnwwnwnwnwwswsewnwnwnwnwewwwnw
nwneswnwswnenwenwnwnenwnwwsenwnwnwnwne
eeeeeeneneneeweeeese
seseswseswneneseseswsenwseseseswseswsesee
wswwseswswswswswewwswnwnewsww
esenwwwseswwwnewwewnewwwww
seeeeeneeseeesenweseesewnwesese
eswwewwwwnwwwwwsewwwewnwsw
seeseeseesenwnwseeswsweswseseseesesenw
eeseeweeeseeeeeeeee
seeeseewswsenwseenwseeseneneswese
nwnwnwwneneneneewnwenenenenwsenwswnw
wsesweswnewswneswsenesewswnwseswnesene
seswseseseswseseseseswnwswswseswsesenwe
newnenesewneneneeneneseneeneneneesw
swswswswwsweswswwwwswsenweswnwwne
enwwwnwswswswwsew
nwnwnwneswnenwnwnwnenenwe
nenwneneseswnenwnenwneswneswwswneseee
eneneneeneswswneneenwswenwwneseenenw
seseswnwsenwsewswnewnwwneewneswswnew
eneneenenenenenenenenewnenenenesw
neswneswwneneewseneneeewnwnenenwne
swnwnewneeseswnweneswnwsenwnwwsewe
swwenenwswwnwsweseswswsw
senenwnenenenewnwnewnwenwnwneeneswnee
wnewneswswswwneseswww
sewwweswsewseswswswswnewseeneesw
wnwnwwsewwnwneseewwwnwsenwwww
swswswwswwswewwswswswseeswswnwswsw
seswneswsewswswswseseeswsw
nwwwnwsenwwseseneewwnwnwwwwnw
swswswswnwswwswsewne
sewneswswwweseneneeswnwnwswewswswe
nenwenwenwnwwnwnenwnenenenwnwneswnenw
eeneseseseseenwseswnewsesenwwew
nenwnesenenwwnenenenwnenenwneene
swseeseseseswsenewseseeswswnwswwswnwnwne
nwnenwnenwwnewswswseenwnwnwnw
seseswseswwsweswswswsenwswsenenwswswseswsw
nwwwsewwwwwnenwnwwwwwnwsenwsew
nenwnenwnenenenwnenwnenenesewneswnenenw
neenwnenesenwnenwnwneenwseswnwwwnwne
nenwnwnesenwnwenwnwsenwnwnwnwnwnwnwnww
swwwwwswwneswwwwsewwswwswenw
nwswswwswnwseseenww
nenwsesewneeswnwnenesenesenenewnwneee
swnewweneswseswswswswswswswswneswswswnwsw
eneseneeswwnwwnwnwsesewswenwnwsewnw
nweswnenenesenwneneneneswenenenenenenwnw
swnwnweneseenwewnweeswsenwswswnwese
esenwsweenwseeseeeeeesesweeese
wwwwwwwwwwwnesewww
swseswsesesenwseswswse
seseseswseesewseswseseseswswsese
wseeswswneseseswnwnwswswswnewwwwsw
wnwenwnwswnwnwswnwewewwnwnewnwnwse
enenwnwwwnwwwsenenwswnwseneseswnenw
eeeeswseseeeeseeeenwswnweeese
nwneswswswseswswwswswseeswswswwseswswsw
swseswnwswseswneswswswswswswsweswswsww
swswswswnwswswswsenweseseswseneseswswne
eswwnweseesesewnwsesesenwseseneesesese
enwseewnesweeenenwneseeswneeswenwe
wswwswswwseewswwnwwwseswnwswenw
nwnwnwwnwnwnwswnwnwnwe
swsenwnenwnwnwnwwe
nwseeseneeeeseeeeeeeswneseswe
neeeeewnenewnesesw
nwsewesenwnwnenenwnwsewwseneenwswnwnw
nwsewwnenenenesenwnwsenwsewnesenenwse
swsenenenwseseseswswsenwweeswsenwwsesw
wewswswwswwwwnenweswwsw
sewwwwneswnewwswwwwwwwnewwww
nenwnesenwenenwnenesenenwswswenewwnenene
eneeneeseeewneeneee
seswnwwwnenwewewnwenwwnwnwsesew
swseenewnesenwwsenwwseswnese
senwwwwewsenwwnwnwnwnwswnwnenwwswnwne
nwseseseneswsenenesesenewnesesenwswwseswe
sesewnwnwnweeswnwnwwnwnwwnwnenwnwnese
nwneneneenenwneswnwnwneneneneswnenenene
wweseseswswneswsesweseswseseswsewswe
esweseeeseswnwsenwseenwsenweesew
neswseeweeesweseeseesesenwseee
nwwnwnwswesewneenwsesewwwnwnwnww
nesewneseneeneneeeeenenewnenenenenenw
eswswswwswswwwwswnwswswwwswswsene
eeneneeneenenenwnenenewneeeeewsw
swseswneswswseseswswneseneswsesesese
weweseneneesweswswnenwenwnwwseswse
nenewnweesenenwneneneneeseneeneenenese
enenwwnwnwnwnwnewnwnwwswwwnwnwwnwse
seeseswseseeenwsesenesenwseseeeese
neenwwnesenwneneneswsenenenwnwsenwnwwne
swwwswswswnwwewswnewwnewwwswswsw
seswsesesesesewsesesenewneneseesesese
neswswnwswswswseswwnesewswnwse
wseseswnwsenwswswswseseeeswnewseeswsw
seseewenwseseseesesew
seneswseswnweneseswnwwnwsenenwsenwsesww
wwseneswswwswwneseswswswswwseswswwne
"""
