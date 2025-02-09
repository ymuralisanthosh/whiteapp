package com.example.whiteapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class WhiteApp {

    public static void main(String[] args) {
        SpringApplication.run(WhiteApp.class, args);
    }
}

@RestController
class WhiteController {

    @GetMapping("/")
    public String displayWhite() {
        return "<h1 style=\"color: white; background-color: black;\">White App</h1>";
    }
}

