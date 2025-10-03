package com.sava;

import java.util.concurrent.ConcurrentHashMap;

public class UserStore {
    private static ConcurrentHashMap<String, User> users = new ConcurrentHashMap<>();

    public static boolean addUser(String username, String password) {
        if (users.containsKey(username)) return false;
        users.put(username, new User(username, password));
        return true;
    }

    public static boolean validate(String username, String password) {
        User user = users.get(username);
        return user != null && user.getPassword().equals(password);
    }
}
