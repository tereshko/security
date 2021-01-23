package me.tereshko.security.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.tereshko.security.models.User;
import me.tereshko.security.services.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@Slf4j
@RequiredArgsConstructor
public class MainController {
    private final UserService userService;

    @GetMapping("/app/score/inc")
    public void increment(Principal principal) {
        User user = userService.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("unable to fing user by username: " + principal.getName()));
        Long score = user.getScore();
        score++;
        user.setScore(score);
        userService.saveUser(user);
    }

    @GetMapping("/app/score/dec")
    public void decrement(Principal principal) {
        User user = userService.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("unable to fing user by username: " + principal.getName()));
        Long score = user.getScore();
        score--;
        user.setScore(score);
        userService.saveUser(user);
    }

    @GetMapping("/app/get/current")
    public String getCurrent(Principal principal) {
        User user = userService.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("unable to fing user by username: " + principal.getName()));
        return "user: " + user.getUsername() + " score is: " + user.getScore();
    }

    @GetMapping("/app/get/{id}")
    public String getCurrentById(Principal principal, @PathVariable Long id) {
        User user = userService.findById(id)
                .orElseThrow(() -> new RuntimeException("unable to fing user by username: " + principal.getName()));
        return "user: " + user.getUsername() + " score is: " + user.getScore();
    }

}
