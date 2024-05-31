import re
from pathlib import Path
from typing import Callable


match_first_digit_re = re.compile(
    ".*?(one|two|three|four|five|six|seven|eight|nine|[0-9])"
)
match_second_digit_re = re.compile(
    ".*(one|two|three|four|five|six|seven|eight|nine|[0-9])"
)

digit_for_word = {
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
}


def extract_calibration_from_a_line_of_text(line: str) -> int:
    first_digit: str | None = None
    second_digit: str | None = None

    for char in line:
        if str.isdigit(char):
            first_digit = char
            break

    for char in line[::-1]:
        if str.isdigit(char):
            second_digit = char
            break

    if first_digit is None:
        return 0

    return int(f"{first_digit}{second_digit}")


def extract_calibration_from_a_line_of_text_phase_2(line: str) -> int:
    first_digit_match = re.match(match_first_digit_re, line)
    second_digit_match = re.match(match_second_digit_re, line)

    if first_digit_match is None or second_digit_match is None:
        return 0

    possible_first_digit: str = first_digit_match.groups()[0]
    if possible_first_digit in digit_for_word:
        first_digit = digit_for_word[possible_first_digit]
    else:
        first_digit = possible_first_digit

    possible_second_digit: str = second_digit_match.groups()[0]
    if possible_second_digit in digit_for_word:
        second_digit = digit_for_word[possible_second_digit]
    else:
        second_digit = possible_second_digit

    return int(f"{first_digit}{second_digit}")


def extract_sum_of_calibration_values(
    filename: Path, extractor: Callable[[str], int]
) -> int:
    sum = 0
    with open(filename, "r") as f:
        for line in f:
            sum += extractor(line)
    return sum


def main() -> None:
    data_file = Path("day-1.input")
    phase_1_result = extract_sum_of_calibration_values(
        data_file, extract_calibration_from_a_line_of_text
    )
    print(f"For phase one, the sum of all the calibration values is {phase_1_result}.")
    phase_2_result = extract_sum_of_calibration_values(
        data_file, extract_calibration_from_a_line_of_text_phase_2
    )
    print(f"For phase two, the sum of all the calibration values is {phase_2_result}.")


if __name__ == "__main__":
    main()
