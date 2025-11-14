/**
 * Utility class to count negative numbers in a list.
 * Author: Vasantharaj K
 * Description:
 *   This class provides a simple method to count
 *   how many negative integers exist in a given List<Integer>.
 */
public class Demo {

    // Holds the total count of negative numbers.
    public Integer count = 0;

    /**
     * Counts negative numbers from the provided list.
     *
     * @param numbers List of integers to evaluate
     */
    public void negativeNumCount(List<Integer> numbers) {

        // Validate input
        if (numbers == null || numbers.isEmpty()) {
            System.debug('Input list is empty or null. No values to process.');
            return;
        }

        // Loop through each number and count negatives
        for (Integer n : numbers) {
            if (n < 0) {
                count++;
            }
        }

        // Final result
        System.debug('Total negative numbers found: ' + count);
    }
}

// -------- Execution Example -------- //
List<Integer> numbers = new List<Integer>{3, 5, 6, 7, 8, -3, -5, -7};
Demo obj = new Demo();
obj.negativeNumCount(numbers);
/*
---------------------------------------------
Expected Output (Debug Logs):
Total negative numbers found: 3
---------------------------------------------
*/
