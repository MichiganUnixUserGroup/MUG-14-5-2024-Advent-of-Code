import Foundation

let filename = "advent_input_01.txt"

let contents = try! String(contentsOfFile: filename)
let lines = contents.split(separator:"\n")

let digits =  "123456789"

var calibration1st = 0
var calibration2nd = 0

var firstDigit = ""
var lastDigit = ""

for line in lines{
    firstDigit = ""
    lastDigit = ""
    for char1 in line {
        let char = String(char1)
        if digits.contains(char)  {
            firstDigit = char
            break
        }
    } 
    for char1 in line.reversed() {
        let char = String(char1)
        if digits.contains(char)  {
            lastDigit = char
            break
        }
    } 

    let firstInt = Int(firstDigit) ?? 0
    let lastInt = Int(lastDigit) ?? 0

    calibration1st += firstInt * 10 + lastInt

    let linex = line.replacingOccurrences(of: "one",   with: "o1e")
                    .replacingOccurrences(of: "two",   with: "t2o")
                    .replacingOccurrences(of: "three", with: "t3e")
                    .replacingOccurrences(of: "four",  with: "f4r")
                    .replacingOccurrences(of: "five",  with: "f5e")
                    .replacingOccurrences(of: "six",   with: "s6x")
                    .replacingOccurrences(of: "seven", with: "s7n")
                    .replacingOccurrences(of: "eight", with: "e8t")
                    .replacingOccurrences(of: "nine",  with: "n9e")

    firstDigit = ""
    lastDigit = ""
    for char1 in linex {
        let char = String(char1)
        if digits.contains(char)  {
            firstDigit = char
            break
        }
    } 
    for char1 in linex.reversed() {
        let char = String(char1)
        if digits.contains(char)  {
            lastDigit = char
            break
        }
    } 

    let firstInt2 = Int(firstDigit) ?? 0
    let lastInt2 = Int(lastDigit) ?? 0

    calibration2nd += firstInt2 * 10 + lastInt2

    /**
    print ()
    print (line )
    print (firstInt, lastInt, calibration1st)
    print (linex )
    print (firstInt2, lastInt2, calibration2nd)
    **/

}

print ("The first half  Calibration number is \(calibration1st). Should be 54708")
print ("The second  half  Calibration number is \(calibration2nd). Should be 54087")
