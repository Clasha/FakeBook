package edu.kosta.com.utils;

public final class Functions {

    private Functions() {
        //
    }

    public static String replaceAll(String string, String pattern, String replacement) {
        return string.replaceAll(pattern, replacement);
    }
    
    public static String[] split(String string, String pattern) {
    	return string.split(pattern);
    }

}