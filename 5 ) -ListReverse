public class Demo {

    List<Integer> reversedList = new List<Integer>();

    public void result(List<Integer> num) {

        // Validate input
        if (num == null || num.isEmpty()) {
            System.debug('Input list is empty or null.');
            return;
        }

        // Clear previous results
        reversedList.clear();

        // Add elements at index 0 to reverse
        for (Integer n : num) {
            reversedList.add(0, n); // always valid because reversedList is initialized
        }

        System.debug('Reversed List: ' + reversedList);
    }

    public List<Integer> getResult() {
        return reversedList;
    }
}

//Anonymous Apex Window
Demo d = new Demo();
d.result(new List<Integer>{1, 2, 3, 4, 5});
System.debug('Result from getResult(): ' + d.getResult());

//Output:
Reversed List: (5, 4, 3, 2, 1)
Result from getResult(): (5, 4, 3, 2, 1)
