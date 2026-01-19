public class NumberUtility {

    public static String getEvenOrOdd(Integer number) {
        if (Math.mod(number, 2) == 0) {
            return 'even';
        } else {
            return 'odd';
        }
    }
}
//----------------------------------------------------------------
@IsTest
public class NumberUtilitySpec {

    @IsTest
    static void shouldReturnEvenForEvenNumber() {
        String result = NumberUtility.getEvenOrOdd(4);
        System.assertEquals('even', result);
    }

    @IsTest
    static void shouldReturnOddForOddNumber() {
        String result = NumberUtility.getEvenOrOdd(7);
        System.assertEquals('odd', result);
    }
}
/*
How do you write an Apex utility method to determine whether a number is even or odd, 
and ensure 100% code coverage using a test class that validates both logical branches?
*/
