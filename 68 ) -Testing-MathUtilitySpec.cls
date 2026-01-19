public class MathUtility {

    /**
     * Returns the sum of two integers.
     */
    public static Integer addNumbers(Integer firstNumber, Integer secondNumber) {
        return firstNumber + secondNumber;
    }
}
//------------------------------------------------------------------------------------------
@IsTest
public class MathUtilityTest {

    @IsTest
    static void shouldAddTwoIntegersCorrectly() {

        // Act
        Integer actualResult = MathUtility.addNumbers(5, 4);

        // Assert
        System.assertEquals(
            9,
            actualResult,
            'The sum of 5 and 4 should be 9'
        );
    }
}
