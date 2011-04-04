# @selenium
Feature: Process Orders
  In order to efficiently ship completed orders
  As a order entry person
  I want a process to apply complex rules on an order automatically

  Background:
    Given I have an order
    And the order has been paid for

  Scenario: Generate packing slip for physical products
    Given the order has a physical product
    And I goto the order review page
    When I process the order
    Then I should receive a processing complete message
    And I should receive a packing slip for shipping
    And the packing slip should contain the physical product

  Scenario: Generate duplicate packing slip for books
    Given the order has a book
    And I goto the order review page
    When I process the order
    Then I should receive a processing complete message
    And I should receive a packing slip for shipping
    And the packing slip should contain the book
    And I should receive a packing slip for royalties
    And the packing slip should contain the book

  Scenario: Send email to the membership owner for activations/upgrades
    Given the order has a membership
    And I goto the order review page
    When I process the order
    Then I should receive a processing complete message
    And an email notification is sent to the membership owner
    And the email should contain the membership purchased

