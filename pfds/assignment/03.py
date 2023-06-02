# List of ints given in prompt
numbers: list[int] = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# Print each number using for loop
print("Print each number using for loop")
for number in numbers:
    print(number, end=" ")
print("\n")


# Function which doubles the input number
def multiply_by_2(number: int | float) -> int | float:
    return number * 2


# Test output of `multiply_by_2`
x: int = 21
print(f"Test `multiply_by_2` function with input of {x}")
print(f"multiply_by_2({x}) = {multiply_by_2(x)}\n")


# Function which returns the sum of input list
def sum_of_numbers(numbers: list[int] | list[float]) -> int | float:
    sum: int | float = 0
    for number in numbers:
        sum += number

    return sum


# Test output of `sum_of_numbers`
print(f"Test `sum_of_numbers` function with input of {numbers}")
print(f"sum_of_numbers({numbers}) = {sum_of_numbers(numbers)}\n")


# Using global variable to count even numbers in a list
def count_numbers(numbers: list[int]) -> None:
    global count  # Get `count` from the global scope
    for number in numbers:
        if number % 2 == 0:
            count += 1

    print(f"Count of even numbers in {numbers} = {count}")
    print(f"{count = }\n")


count: int = 0  # Init `count` in the global scope
count_numbers(numbers)


# Function which prints the sum of input list
def print_sum_of_numbers(numbers: list[int] | list[float]) -> None:
    # ^ Renamed to `print_sum_of_numbers` was to prevent name collision
    result: int | float = 0  # Init `result` in the local scope
    for number in numbers:
        result += number

    print(f"Sum of numbers in list {numbers} = {result}")
    print(f"{result = }\n")


print_sum_of_numbers(numbers)
