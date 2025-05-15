package assignments.a;

public class StringUtilities {
    public static boolean isPangram(String sentence) {
        boolean[] letterMask = new boolean[26];
        String normalizedSentence = sentence.toUpperCase();
        for (char c : normalizedSentence.toCharArray()) {
            byte b = (byte) c;
            int alphabetIndex = b - ((byte) 'A');
            if (alphabetIndex < 0 || alphabetIndex > 25) continue;  // not alphanumeric
            letterMask[alphabetIndex] = true;
        }
        for (boolean b : letterMask) {
            if (!b) return false;
        }
        return true;
    }

    public static String maskEmail(String email) {
        String[] parts = email.split("@");
        if (parts.length < 2) return email;

        String local = parts[0];
        StringBuilder maskedLocal = new StringBuilder(local);
        for (int i = 1; i < local.length() - 1; i++) {
            maskedLocal.setCharAt(i, '*');
        }
        return String.format("%s@%s", maskedLocal, parts[1]);
    }

    public static String compress(String input) {
        StringBuilder runLengthEncoded = new StringBuilder();
        char current = input.charAt(0);
        int charCounter = 0;
        for (int i = 0; i < input.length(); i++) {
            char c = input.charAt(i);
            charCounter++;
            if (i == input.length() - 1 || input.charAt(i + 1) != c) {
                runLengthEncoded.append(c);
                runLengthEncoded.append(charCounter);
                charCounter = 0;
            }
        }
        return runLengthEncoded.toString();
    }

    public static String removeDuplicates(String word) {
        StringBuilder withoutDuplicates = new StringBuilder();
        boolean[] letterMask = new boolean[((byte) 'z') - ((byte) 'A') + 1];
        for (char c : word.toCharArray()) {
            byte b = (byte) c;
            int alphabetIndex = b - ((byte) 'A');
            boolean inBounds = alphabetIndex > 0 && alphabetIndex < letterMask.length;
            if (inBounds) {
                if (letterMask[alphabetIndex]) continue;    // letter has been seen before
                letterMask[alphabetIndex] = true;
            }
            withoutDuplicates.append(c);
        }
        return withoutDuplicates.toString();
    }

    public static String alternateCase(String input) {
        StringBuilder alternated = new StringBuilder();
        boolean isUpper = true;
        for (char c : input.toCharArray()) {
            if (!Character.isLetter(c)) {
                alternated.append(c);
                continue;
            };
            alternated.append(isUpper ? Character.toUpperCase(c) : Character.toLowerCase(c));
            isUpper = !isUpper;
        }
        return alternated.toString();
    }
}
