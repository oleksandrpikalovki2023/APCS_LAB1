package ua.edu.apcs.helloworld;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class AppTest {
    @Test
    void greetingReturnsHelloWorld() {
        assertEquals("Hello, World!", App.greeting());
    }

    @Test
    void testBasicAddition() {
        assertEquals(5, App.add(2, 3));
    }
}
