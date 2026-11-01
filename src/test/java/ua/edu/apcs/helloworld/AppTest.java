package ua.edu.apcs.helloworld;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class AppTest {
    @Test
    void greetingReturnsHelloWorld() {
        assertEquals("Hello, World!", App.greeting());
    }
}

