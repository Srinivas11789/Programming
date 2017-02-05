import random
r = random.randint(0,10000)
key = input("Enter the Key: ")
print ("Combination is %d xor %d") % (r,key)
xor = r ^ key
print xor

