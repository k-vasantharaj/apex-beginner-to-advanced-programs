/**
 * @description      Apex class to extract, store, and return all negative 
 *                   numbers from a provided list of integers.
 * 
 * @author           Vasantharaj K
 * @date             2025-11-15
 */

public class Demo {

    // Stores the filtered negative numbers
    private List<Integer> negativeNumbers = new List<Integer>();

    /**
     * @description  Filters negative numbers from the input list and stores them.
     *
     * @param        num - The list of integers to evaluate
     */
    public void result(List<Integer> num) {

        // Validate input
        if (num == null || num.isEmpty()) {
            System.debug('Input list is empty or null.');
            negativeNumbers.clear();
            return;
        }

        // Reset old results
        negativeNumbers.clear();

        // Filter negative values
        for (Integer n : num) {
            if (n < 0) {
                negativeNumbers.add(n);
            }
        }

        // Print result for debugging
        System.debug('Negative Numbers (Inside result): ' + negativeNumbers);
    }

    /**
     * @description   Returns the list of negative numbers.
     * @return        List<Integer> - all negative values collected
     */
    public List<Integer> getResult() {
        return negativeNumbers;
    }
}
//📝 Example Usage in Anonymous Apex Window
// Create instance of Demo
Demo d = new Demo();

// Call result() with sample list
d.result(new List<Integer>{3, -10, 8, -25, 4, -1});

// Get filtered negative numbers
System.debug('Result from getResult(): ' + d.getResult());
//Output:

Negative Numbers (Inside result): (-10, -25, -1)
Result from getResult(): (-10, -25, -1)
