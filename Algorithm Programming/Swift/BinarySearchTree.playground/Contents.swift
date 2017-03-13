//: Playground - noun: a place where people can play

import Cocoa

class node {
    var Data: Int
    var left: node?
    var right: node?
    var parent: node?
    init(value: Int){
        self.Data = value
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

func insert(root: node?, node: node) {
    if root == nil {
        root?.Data = node.Data;
    } else if node.Data < (root?.Data)! {
        if root?.left == nil {
            root?.left = node;
        } else {
            insert(root: (root?.left),node: node)
        }
    } else if node.Data > (root?.Data)! {
        if root?.right == nil {
            root?.right = node
        } else {
            insert(root: root?.right, node: node)
        }
    }
}

var r: Int = 0
func search(root: node?, value: Int)->Int {
    if root == nil {
       r = 0
    } else if value < (root?.Data)! {
        if root?.left == nil {
            r = 0
    } else {
        search(root: root?.left, value: value)
    }
    } else if value > (root?.Data)! {
        if root?.right == nil {
            r = 0
        } else {
            search(root: root?.right, value: value)
        }
    } else {
        r = 1
    }
return r
}

func minima(x: inout node?)->node {
    if x == nil {
        return (x)!
    }
    while x?.left != nil {
        x = (x?.left)!
    }
    print("Minima is \((x?.Data)!)")
    return (x)!
}

func maxima(x: inout node?)->node {
    if x == nil {
        return (x)!
    }
    while x?.right != nil {
        x = (x?.right)!
    }
    print("Maxima is \((x?.Data)!)")
    return (x)!
}


func inorder(root: node?) {
    if root == nil {
        return
    }
    inorder(root: root?.left)
    print ((root?.Data)!)
    inorder(root: root?.right)
}

func preorder(root: node?) {
    if root == nil {
        return
    }
    print ((root?.Data)!)
    inorder(root: root?.left)
    inorder(root: root?.right)
}

func postorder(root: node?) {
    if root == nil {
        return
    }
    inorder(root: root?.left)
    inorder(root: root?.right)
    print ((root?.Data)!)
}

func successor(root: inout node?)->Int {
    if root == nil {
        return 0
    }
    else if root?.right != nil {
        var t: node? = root
        let min: node? = minima(x: &t)
        return (min?.Data)!
    }
    else {
        var parent: node? = root?.parent
        if parent == nil {
            while (parent != nil && root?.Data == parent?.right?.Data) {
                root = parent
                parent = parent?.parent
            }
        }
    print("successor of root: \((root?.Data)!) is (\(parent?.Data)!)")
    return (parent?.Data)!
    }
    
}

func main() {
    let root = node(value: 3)
    insert(root: root, node: node(value: 7))
    insert(root: root, node: node(value: 1))
    insert(root: root, node: node(value: 5))
    insert(root: root, node: node(value: 2))
    preorder(root: root)
    print ("Search Results: \(search(root: root, value: 5))")
    var temp: node? = root
    minima(x: &temp)
    var temp1: node? = root
    maxima(x: &temp1)
   // successor(root: &temp1)
}

main()




