# Original list of numbers
numbers: list[int] = list(range(10 + 1))

# Filter in even numbers, and then square them
is_even = lambda x: x % 2 == 0  # Req: use lambda function to determine odd/even
even_square: list[int] = [number**2 for number in numbers if is_even(number)]

# Print original and square of even numbers
print(f"Original list: {numbers}")
print(f"Square of even numbers: {even_square}")
