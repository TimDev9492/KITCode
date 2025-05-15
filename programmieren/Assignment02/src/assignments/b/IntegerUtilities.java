package assignments.b;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public final class IntegerUtilities {
    // make constructor inaccessible
    private IntegerUtilities() {}

    public static int[] greaterThan(int[] values, int threshold) {
        return Arrays.stream(values).filter(value -> value > threshold).toArray();
    }

    public static int[] getOdds(int[] values) {
        return Arrays.stream(values).filter(value -> (value & 1) == 1).toArray();
    }

    public static int search(int[] values, int key) {
        for (int i = 0; i < values.length; i++) {
            if (values[i] == key) return i;
        }
        return -1;
    }

    public static int[] sort(int[] values) {
        int[] copy = Arrays.copyOf(values, values.length);
        Arrays.sort(copy);
        return copy;
    }

    public static double median(int[] values) {
        int[] sorted = IntegerUtilities.sort(values);
        int middleIndex = (sorted.length - 1) / 2;
        if ((sorted.length & 1) == 1) {
            return sorted[middleIndex];
        }
        return ((double) sorted[middleIndex] + sorted[middleIndex + 1]) * 0.5;
    }

    public static int[] common(int[] first, int[] second) {
        Set<Integer> lookup = new HashSet<>();
        for (int value : second) lookup.add(value);
        return Arrays.stream(first).filter(lookup::contains).toArray();
    }

    public static boolean isSortedAscending(int[] values) {
        for (int i = 0; i < values.length; i++) {
            if (i == values.length - 1) break;
            if (values[i] >= values[i+1]) return false;
        }
        return true;
    }

    public static boolean areDisjoint(int[] first, int[] second) {
        return IntegerUtilities.common(first, second).length == 0;
    }
}
