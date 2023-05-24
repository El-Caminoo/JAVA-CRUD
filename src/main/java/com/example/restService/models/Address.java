package com.example.restService.models;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "Address")
public class Address {
  @Id
  @GeneratedValue(strategy = GeneratedType.AUTO)
  private Long id;

  @Column(name = "Number")
  private Integer number;

  @Column(name = "Street")
  private String street;

  @Column(name = "City")
  private String city;

  @Column(name = "State")
  private String state;
}
