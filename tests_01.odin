package test

import "core:fmt"
import "core:math"
print :: fmt.println

main :: proc() {

	val := get_irrational_number_between_two_squares(4, 7, context.temp_allocator)
	print(val)

	free_all(context.temp_allocator)

}

is_prime :: proc(n: int) -> bool {
	assert(n > 1, "n must be greater than 1.")
	for val in 2 ..< (n / 2) + 1 {
		if n % val == 0 do return false
	}
	return true
}

get_irrational_number_between_two_squares :: proc(
	a: int,
	b: int,
	allocator := context.allocator,
) -> map[int]f32 {
	a_squared := a * a
	b_squared := b * b

	local_dict := make(map[int]f32, allocator = allocator)
	for val in a_squared ..< b_squared {
		if is_prime(val) {
			local_dict[val] = math.sqrt_f32(f32(val))
		}
	}
	return local_dict
}
