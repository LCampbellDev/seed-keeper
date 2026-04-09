"Create a function to calculate the final single digit sum of a number"

# Example Input: 9875 ==> Example Output: 2

# === REASONING ===
# 9875 -> 9 + 8 + 7 + 5 -> 29
# 29 -> 2 + 9 -> 11
# 11 -> 1 + 1 -> 2

"""
First approach is brute force to check logic
"""

number = 9875
number_string = str(number) # we need to loop through the digits so needs to be iterable

total = 0
for num in number_string:
    total += int(num)

# the above would only get us to 29 though, so we need a bigger loop OR even better (as asked for) make the above logic a function


"""
Second approach: refactor, optimise
"""

def sum_to_single_digit(n):
    while n > 9: # another check would be len(n) == 1. The current condition works if we know n is always positive
        n = sum(int(d) for d in str(n))
        # The above line does quite a bit, using comprehension it iterates through every digit string in a string copy of n
        # It then adds string digits as integers to a list, and puts the list in the sum function
        # The sum function adds all the numbers in the list and sets it as the new "n"

    return n # this will only return when n <= 9 aka when it's a single digit [n would have to be 0,1,2,3,4,5,6,7,8 or 9]

print(sum_to_single_digit(9875))


"""
Great work all! 👏👏
"""





