# Given two integers a and b:
# List a set of irrational numbers between a and b by listing
# the square roots of all the prime numbers between a**2 and b**2.

import math


def is_prime(n: int) -> bool:
    for val in range(2, (n // 2) + 1):
        if n % val == 0:
            return False

    return True


def get_irrational_number_between_two_squares(a: int, b: int) -> dict[int, float]:
    a_squared = a * a
    b_squared = b * b
    print(a_squared)
    print(b_squared)

    local_dict = dict()
    for val in range(a_squared, b_squared):
        if is_prime(val):
            local_dict[val] = math.sqrt(val)

    return local_dict


def main() -> None:
    val = get_irrational_number_between_two_squares(4, 7)
    print(val)


if __name__ == '__main__':
    main()
