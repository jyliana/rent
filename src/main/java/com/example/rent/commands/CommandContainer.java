package com.example.rent.commands;

import java.util.HashMap;
import java.util.Map;

public class CommandContainer {
    private static final Map<String, Command> commands;

    static {
        commands = new HashMap<>();
        commands.put("registrationUser", new RegistrationUserCommand());
        commands.put("logInUser", new LogInUserCommand());
    }

    public static Command getCommand(String CommandName) {
        return commands.get(CommandName);
    }
}