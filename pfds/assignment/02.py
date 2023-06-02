from functools import reduce


# Utility to print data and datatype
def print_with_type(message: str, data) -> None:
    print(f"{message}: {data}")
    print(f"Type: {type(data)}\n")


# Original list of numbers
numbers: list[int] = [4, 6, 2, 8, 9, 1, 7, 3, 5, 4, 6, 7, 8, 9, 9, 2, 1]
print_with_type("Original list", numbers)

# Filter unique elements
unique_numbers: set[int] = set(numbers)
unique_numbers_as_list: list[int] = list(unique_numbers)
print_with_type("Unique numbers", unique_numbers_as_list)

# Tuple of first 5 numbers from the original list
first_five_numbers: tuple[int, ...] = tuple(numbers[0:5])
print_with_type("First five numbers", first_five_numbers)

# Set of even numbers from the original list
unique_even_numbers: set[int] = set(filter(lambda x: x % 2 == 0, unique_numbers))
print_with_type("Unique even numbers", unique_even_numbers)

# Dictionary of number of occurrences of each number in original list
frequency: dict[int, int] = dict()
for number in numbers:
    if number in frequency:
        frequency[number] += 1
    else:
        frequency[number] = 1

print_with_type("Frequency of numbers", frequency)

# Double each number in original list using `map`
numbers_times_two: list[int] = list(map(lambda x: 2 * x, numbers))
print_with_type("Double of each number in original list", numbers_times_two)

# Filter out odd numbers === filter in even numbers
even_numbers: list[int] = list(filter(lambda x: x % 2 == 0, numbers))
print_with_type("Odd numbers filtered out of original list", even_numbers)

# Sum of all numbers in the original list
sum: int = reduce(lambda x, y: x + y, numbers)
print_with_type("Sum of numbers in original list", sum)
