//: [Previous](@previous)
/*:
 ## Array and Dictionaries
 
  Arrays and dictionaries allow us to store a collection of data. Create arrays and dictionaries using brackets '[]'. Remember that arrays hold a collection data based on an index, so we can access a value by writing the desired index within the brackets. Arrays also begin at index `0`. Dictionaries hold a key and a value, and we can access a value by writing the desired key within the brackets.
 */

// We can declare an array with square brackets syntax
var myNumberArray = [1,2,3]
print("The value at index 1 is: \(myNumberArray[1])")

// We can declare a dictionary with square brackets and key/value data
var myDictionary = ["Students" : 5, "Teachers" : 2]

// This is how we add a new key/value to our dictionary
myDictionary["Principal"] = 1

/*:
 - Experiment:
 Try creating an array and dictionary using `'let'` vs `'var'` then try adding something to them. What do you notice? For the array, you can use a method called 'append' to add something to it.
 */
let array1 = [1,2,3]
var array2 = [4,5,6]
//array1.append(contentsOf: [4])
array2.append(contentsOf: [7])

let array3 = ["first" : 1, "second" : 2, "third" : 3]
var array4 = ["fourth" : 4, "fifth" : 5, "sixth" : 6]
//array3["fourth"] = 4
array4["seventh"] = 7

/*:
 - Experiment:
 Try creating an empty array with an explicit type `[type]`. What happens when you add a value that isn't the same type?
 */
var array5 = [String]()
//array5.append(contentsOf: [1])

/*:
 - Experiment:
 Try creating an empty dictionary with an explicit type. `[keyType: valueType]`
 */
var array6 = [String:Int]()
//array6["first"] = "1"

/*:
 - Experiment:
 Create an array with any values of your choice. Play around with accessing a value at a certain index. Then try playing with the following methods of an array and find out what they do:
 - append
 - insert
 - removeAt
 - removeAll
 - reverse
 - count
 */
var array = [1,2,3,4,5]
print(array[2])
array.append(contentsOf: [6])
array.remove(at: 1)
array.insert(2, at: 1)
//array.removeAll()
array.reverse()
print(array)
print(array.count)

/*:
 - Experiment:
 Create a dictionary with any values of your choice. Play around with accessing a value by its key. Try keys using different case sensitivity, what happens? Then try playing with the following methods of a dictionary and find out what they do:
 - removeValue
 - isEmpty
 - count
 */
var arrayDict = ["a":5, "A":6, "b":7]
arrayDict.removeValue(forKey: "A")
arrayDict.isEmpty
arrayDict.count

/*:
 - Callout(Challenge):
    Declare a mutable array that is empty and holds `Strings`. On the next few lines, add the following names to the array: John, Karen, Jane
 
    Finally, print out each person's name from the array using their index and string interpolation
*/
var arrayNew = [String]()
arrayNew.append(contentsOf: ["John", "Karen", "Jane"])
for index in 0..<arrayNew.count {
    print("Name at index \(index) is \(arrayNew[index])")
}

/*:
 - Callout(Challenge):
  Declare a mutable dictionary with the following names and their salaries
 
    John - $50000
 
    Jane - $70000
 
    Karen - $62000
 
    On the next line, add this last person's info: Bob - $45000
 */
var arrayNewDict = ["John":50000, "Jane":70000, "Karen":62000]
arrayNewDict["Bob"] = 45000
print(arrayNewDict)

//: [Next](@next)
