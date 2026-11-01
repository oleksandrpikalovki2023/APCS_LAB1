package ua.edu.apcs.helloworld;

public final class App {
    private static final String GREETING = "Hello, World!";

    private App() {
    }

    public static String greeting() {
        return GREETING;
    }

    public static void main(String[] args) {
        System.out.println(greeting());
    }
}

