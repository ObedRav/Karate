Feature: Create a new user

Background:
    * url "https://reqres.in/api"

Scenario: Creating a user and get it by id
    Given path "users"
    And request { "name": "Jose", "job": "Programmer" }
    When method POST
    Then status 201
    And match response == { "name": "Jose", "job": "Programmer", "id": '#notnull', 'createdAt': '#notnull' }

    * def id = response.id

    Given path "users", id
    When method GET
    Then status 404
