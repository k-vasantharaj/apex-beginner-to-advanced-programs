/**
 * Utility class to extract positive numbers from a list.
 * Author: Vasantharaj K
 * Description:
 *   This class provides a method that filters and returns
 *   all positive integers from a given List<Integer>.
 */
public class Demo {

    // Stores the list of all positive numbers found.
    public List<Integer> positiveNumbers = new List<Integer>();

    /**
     * Extracts positive numbers from the given list.
     *
     * @param numbers List of integers to process
     */
    public void positiveNums(List<Integer> numbers) {

        // Validate input list
        if (numbers == null || numbers.isEmpty()) {
            System.debug('Input list is empty or null. No values to process.');
            return;
        }

        // Loop through each number and store only positive values
        for (Integer n : numbers) {
            if (n > 0) {
                positiveNumbers.add(n);
            }
        }

        // Final debug output
        System.debug('Positive Numbers: ' + positiveNumbers);
    }
}


// -------- Execution Example -------- //
List<Integer> numbers = new List<Integer>{3, 5, 6, 7, 8, -3, -5, -7};
Demo obj = new Demo();
obj.positiveNums(numbers);

/*
---------------------------------------------
Expected Output:
Positive Numbers: (3, 5, 6, 7, 8)
---------------------------------------------
*/
