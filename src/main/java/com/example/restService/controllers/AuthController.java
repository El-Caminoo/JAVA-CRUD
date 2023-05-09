package com.example.restService.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class AuthController {

  @GetMapping("/signup")
  public ResponseEntity<?> signup(HttpServletRequest request) {
    Map<String, String> response = new HashMap<>();
    response.put("message", "Successfully signed up");
    return new ResponseEntity<>(response, HttpStatus.OK);
  }
}
