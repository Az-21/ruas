# Simple decorator to indicate override (like C# and Java)
def override(f):
    return f


class Student:
    def __init__(self, name, age, major, reg_number) -> None:
        self.name: str = name
        self.age: int = age
        self.major: str = major
        self.reg_number: str = reg_number

    def study(self) -> None:
        print(f"{self.name} is studying")


class GraduateStudent(Student):
    def __init__(self, name, age, major, reg_number, research_topic) -> None:
        super().__init__(name, age, major, reg_number)
        self.research_topic: str = research_topic

    @override
    def study(self) -> None:
        print("Researching!")


class UndergraduateStudent(Student):
    def __init__(self, name, age, major, reg_number, year_level) -> None:
        super().__init__(name, age, major, reg_number)
        self.year_level: int = year_level

    @override
    def study(self) -> None:
        print("Cramming!")


class PhDStudent(GraduateStudent):
    def __init__(self, name, age, major, reg_number, research_topic, advisor) -> None:
        super().__init__(name, age, major, reg_number, research_topic)
        self.advisor: str = advisor

    @override
    def study(self) -> None:
        print("Experimenting!")


class Freshman(UndergraduateStudent):
    def __init__(self, name, age, major, reg_number, residence_hall) -> None:
        year_level: int = 1  # Freshman should default to year 1
        super().__init__(name, age, major, reg_number, year_level)
        self.residence_hall: str = residence_hall

    @override
    def study(self) -> None:
        print("Reading textbooks!")


# Init PhDStudent and Freshman for a student named "John"
phd_john = PhDStudent(
    name="John",
    age=28,
    major="Computer Science",
    reg_number="22-PhD-CS-001",
    research_topic="Artificial Intelligence",
    advisor="Mr. ABC",
)

freshman_john = Freshman(
    name="John",
    age=18,
    major="Electrical and Electronic Engineering",
    reg_number="22-BE-EEE-001",
    residence_hall="West Campus",
)

# Print phd_student attributes
print("PhD Student Attributes (of John)")
print(f"Name: {phd_john.name}")
print(f"Age: {phd_john.age}")
print(f"Major: {phd_john.major}")
print(f"Reg. Number: {phd_john.reg_number}")
print(f"Research Topic: {phd_john.research_topic}")
print(f"Advisor: {phd_john.advisor}\n")

# Print freshman_student attributes
print("Freshman Student Attributes (of John)")
print(f"Name: {freshman_john.name}")
print(f"Age: {freshman_john.age}")
print(f"Major: {freshman_john.major}")
print(f"Reg. Number: {freshman_john.reg_number}")
print(f"Year Level: {freshman_john.year_level}")
print(f"Residence Hall: {freshman_john.residence_hall}\n")

# Call study method for phd_john and freshman_john
print("Calling `.study()` defined for `phd_john`")
phd_john.study()

print("\nCalling `.study()` defined for `freshman_john`")
freshman_john.study()
