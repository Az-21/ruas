from functools import reduce


# Take list of ints as input from user
def get_integers_from_user() -> list[int] | None:
    try:
        raw_input: list[str] = input("Enter a list of comma separated numbers: ").split(",")
        numbers_f: list[float] = [float(x) for x in raw_input]  # Cast as float first
        numbers: list[int] = [int(x) for x in numbers_f]  # Then cast to int to trim float
        print(f"Parsed {raw_input} as {numbers}\n")
        return numbers

    except ValueError:
        print("Invalid input, please enter a comma separated list of integers")
        print("Example: 1, 2, 3, 4, 5\nRetrying...\n")
        return None


# Get integers from user
while True:
    numbers: list[int] | None = get_integers_from_user()
    if numbers is not None:
        break

# Print square of each number
numbers_squared: list[int] = list(map(lambda x: x**2, numbers))
print(f"Numbers: {numbers}")
print(f"Square of numbers: {numbers_squared}")

# Filter out odd numbers from the original input list
even_numbers: list[int] = list(filter(lambda x: x % 2 == 0, numbers))
print(f"\nEven numbers in given list: {even_numbers}")

# Product of even numbers
if len(even_numbers) != 0:
    product_even: int = reduce(lambda x, y: x * y, even_numbers)
    print(f"Product of even numbers: {product_even}")
else:
    print("No even number found. Product is not defined.")
