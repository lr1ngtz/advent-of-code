// https://adventofcode.com/2015/day/4
package main

import (
	"crypto/md5"
	"fmt"
	"strconv"
)

func main() {
	const secret = "bgvyzdsv"
	target := "00000"
	target_part_two := "000000"

	computeNum(secret, target)
	computeNum(secret, target_part_two)

}

func computeNum(secret, target string) {
	prefix := []byte(secret)
	counter := 1

	var numBuf [20]byte

	for {
		numBytes := strconv.AppendInt(numBuf[:0], int64(counter), 10)

		h := md5.New()
		h.Write(prefix)
		h.Write(numBytes)
		hash := fmt.Sprintf("%x", h.Sum(nil))

		if len(target) == 5 {
			if hash[:5] == target {
				fmt.Printf("part one: %d\n", counter)
				break
			}
		} else {
			if hash[:6] == target {
				fmt.Println(counter)
				break
			}
		}

		counter++
	}
}
