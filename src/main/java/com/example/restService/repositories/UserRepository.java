package com.example.restService.repositories;

import com.example.restService.models.User;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
  List<User> findByName(String name);
  User findByEmail(String email);
}
