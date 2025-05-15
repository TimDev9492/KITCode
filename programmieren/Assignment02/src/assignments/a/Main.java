package assignments.a;

public class Main {
    public static void main(String[] args) {
        boolean isPangram = StringUtilities.isPangram(" The quick brown fox jumps over the lazy dog ");
        String masked = StringUtilities.maskEmail("what@domain.com");
        String compressed = StringUtilities.compress("aaabbc");
        String duplicatesRemoved = StringUtilities.removeDuplicates("This is my string without duplicates");
        String alternated = StringUtilities.alternateCase("hello world!");
    }
}
