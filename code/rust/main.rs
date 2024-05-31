use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() -> io::Result<()> {
    // Open the file for reading
    let file = File::open("input.txt")?;
    let reader = BufReader::new(file);

    // Create a vector to store the two-digit integers for each line
    let mut two_digit_integers = Vec::new();

    // Iterate over each line in the file
    for line in reader.lines() {
        let line = line?;

        // Create a vector to store the digits on this line
        let mut digits_on_line = Vec::new();

        // Iterate over each character in the line
        for c in line.chars() {
            if c.is_digit(10) {
                // If it's a digit, push it to the vector
                digits_on_line.push(c);
            }
        }

        // Check if there are at least two digits on this line
        if digits_on_line.len() >= 2 {
            // Create a two-digit integer from the first and last digits
            let first_digit = match digits_on_line[0].to_digit(10) {
                Some(digit) => digit,
                None => 0,
            };
            let last_digit = match digits_on_line[digits_on_line.len() - 1].to_digit(10) {
                Some(digit) => digit,
                None => 0,
            };
            let two_digit_integer = first_digit * 10 + last_digit;
            two_digit_integers.push(two_digit_integer);
        } else if digits_on_line.len() == 1 {
            // Create a two-digit integer from the only digit
            let the_only_digit = match digits_on_line[0].to_digit(10) {
                Some(digit) => digit,
                None => 0,
            };
            let two_digit_integer = the_only_digit * 10 + the_only_digit;
            two_digit_integers.push(two_digit_integer);
        }
    }

    // Print the sum of the two-digit integers
    let sum: u32 = two_digit_integers.iter().sum();
    println!("Sum of two-digit integers: {}", sum);
    Ok(())
}
