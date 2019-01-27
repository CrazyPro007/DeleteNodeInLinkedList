import UIKit

class Node<T: Equatable>{
    var value:T?
    var nextNode:Node?
}

class LinkedList<T: Equatable>{
    var headNode: Node = Node<T>()
    
    func insert(value: T){
        if self.headNode.value == nil{
            print("The item \(value) is inserted")
            self.headNode.value = value
        }else{
            var lastNode = self.headNode
            while lastNode.nextNode != nil {
                lastNode = lastNode.nextNode!
            }
            let newNode = Node<T>()
            newNode.value = value
            print("The item \(value) is inserted")
            lastNode.nextNode = newNode
        }
    }
    
    func remove(value: T){
        if self.headNode.value == value{
            print("The item \(value) is removed")
            if self.headNode.nextNode != nil{
               self.headNode = self.headNode.nextNode!
            }else{
                self.headNode.value = nil
            }
        }else{
            var lastNode = self.headNode
            var found = true
            while lastNode.nextNode?.value != value{
                if lastNode.nextNode != nil{
                   lastNode = lastNode.nextNode!
                }else{
                    found = false
                    break
                }
            }
            if found{
                print("The item \(value) is removed")
                if lastNode.nextNode?.nextNode != nil{
                    lastNode.nextNode = lastNode.nextNode?.nextNode!
                }else{
                    //if at the end, the next is nil
                    lastNode.nextNode = nil
                }
            }else{
                print("---------------")
                print("The item \(value) is not found")
                print("---------------")
            }
        }
    }
    
    func printAllKeys() {
        var currentNode: Node! = headNode
        print("---------------")
        print("Items in LINKED LIST")
        while currentNode != nil && currentNode.value != nil {
            print(currentNode.value!)
            currentNode = currentNode.nextNode
        }
        print("---------------")
    }
}

var linkedList = LinkedList<Int>()
linkedList.insert(value: 10)
linkedList.insert(value: 20)
linkedList.insert(value: 30)
linkedList.insert(value: 40)
linkedList.insert(value: 50)
linkedList.printAllKeys()
linkedList.remove(value: 10)
linkedList.printAllKeys()
linkedList.remove(value: 30)
linkedList.printAllKeys()
linkedList.remove(value: 40)
linkedList.printAllKeys()
linkedList.remove(value: 40)
linkedList.printAllKeys()
