package Validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MyValidation {

    private Pattern pattern;
    private Matcher matcher;

    private String REGEX_PASSWORD =  "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";

    public MyValidation() {
    }

    public MyValidation(Pattern pattern, Matcher matcher, String REGEX_PASSWORD) {
        this.pattern = pattern;
        this.matcher = matcher;
        this.REGEX_PASSWORD = REGEX_PASSWORD;
    }

    public Pattern getPattern() {
        return pattern;
    }

    public void setPattern(Pattern pattern) {
        this.pattern = pattern;
    }

    public Matcher getMatcher() {
        return matcher;
    }

    public void setMatcher(Matcher matcher) {
        this.matcher = matcher;
    }

    public String getREGEX_PASSWORD() {
        return REGEX_PASSWORD;
    }

    public void setREGEX_PASSWORD(String REGEX_PASSWORD) {
        this.REGEX_PASSWORD = REGEX_PASSWORD;
    }

    public boolean validatePassword(String string){
        pattern = Pattern.compile(REGEX_PASSWORD);
        matcher = pattern.matcher(string);
        return matcher.matches();

    }
}
