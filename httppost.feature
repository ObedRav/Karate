Feature: Create a new user

Scenario: Creating a user
    Given url "https://reqres.in/api/users"
    And request { "name": "Jose", "job": "Programmer" }
    When method POST
    Then status 201
    And match 
