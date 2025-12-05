// https://adventofcode.com/2015/day/5

package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
	input, ok := os.read_entire_file("day_5_input.txt", context.allocator)
	if !ok {
		return
	}
	defer delete(input, context.allocator)

	nice_strings: int
	lines := string(input)

	for s in strings.split_lines_iterator(&lines) {
		if is_nice_string(s) {
			nice_strings += 1
		}
	}

	fmt.println(nice_strings)
}


is_nice_string :: proc(s: string) -> bool {
	for i in 0 ..< len(s) - 1 {
		pair := s[i:i + 2]
		if pair == "ab" || pair == "cd" || pair == "pq" || pair == "xy" {
			return false
		}
	}

	vowel_count := 0
	for c in s {
		if c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' {
			vowel_count += 1
		}
		if vowel_count >= 3 {
			break
		}
	}
	if vowel_count < 3 do return false

	for i in 0 ..< len(s) - 1 {
		if s[i] == s[i + 1] {
			return true
		}
	}

	return false
}
