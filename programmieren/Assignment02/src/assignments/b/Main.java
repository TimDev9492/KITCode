package assignments.b;

public class Main {
    public static void main(String[] args) {
        int[] values = new int[] {
                3, 53, 23, 5, 24, 8, 78, 9, 6, 34
        };
        int[] otherValues = new int[] {
                3, 5, 8, 15, 35, 78, 89
        };
        int[] greater = IntegerUtilities.greaterThan(values, 10);
        int[] odds = IntegerUtilities.getOdds(values);
        int index = IntegerUtilities.search(values, 5);
        int[] sorted = IntegerUtilities.sort(values);
        double median = IntegerUtilities.median(values);
        int[] common = IntegerUtilities.common(values, otherValues);
        boolean isAscending = IntegerUtilities.isSortedAscending(otherValues);
        boolean disjoint = IntegerUtilities.areDisjoint(values, otherValues);
    }
}
