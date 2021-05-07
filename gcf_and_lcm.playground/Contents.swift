import UIKit

func gcf (nums: Array<Int>) -> Int? {
    let minVal = nums.min()
    var commonFactors =  [Int]()

    for factor in 2...minVal! {
        var next : Bool = true
        for num in nums {
            if num % factor != 0 {
                next = false
                break
            }
        }
        if next {
            commonFactors.append(factor)
        }
    }

    if commonFactors.isEmpty {
        return nil
    }
    return commonFactors.max()
}

func gcfEuclid (a: Int, b: Int) -> Int {
    if b == 0 {return a}
    return gcfEuclid(a: b, b: a % b)
}

func gcfMultiple (nums:[Int]) -> Int {
    var newNums = nums
    if newNums.count == 1 {
        return newNums[0]
    } else if newNums.count == 2 {
        return gcfEuclid(a: newNums[0], b: newNums[1])
    } else {
        let a = newNums.removeFirst()
        let b = newNums.removeFirst()
        newNums.append(gcfEuclid(a: a, b: b))
        return gcfMultiple(nums: newNums)
    }
}

func lcm (nums: [Int]) -> Int {
    var newNums = nums
    if newNums.count == 1 {
        return newNums[0]
    } else if newNums.count == 2 {
        return newNums[0] * newNums[1] / gcfEuclid(a: newNums[0], b: newNums[1])
    } else {
        let a = newNums.remove(at: 0)
        let b = newNums.remove(at: 0)
        newNums.append(a * b / gcfEuclid(a: a, b: b))
        return lcm(nums: newNums)
    }
}

// GCF
var nums = [4,8,6] // Edit the List
print("GCF:", gcfMultiple(nums: nums))

// LCM
var nums2 = [5, 10, 25] // Edit the List
print("LCM:", lcm(nums: nums2))
