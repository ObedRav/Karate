Feature: Using Post requests

Background:
    * url "https://reqres.in/"

Scenario: Creating a user
    Given path "api/users"
    And request { "name": "Jose", "job": "Programmer" }
    When method POST
    Then status 201
    * def regexPattern = '#regex ^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$'
    And match response == { "name": "Jose", "job": "Programmer", "id": '#notnull', 'createdAt': '#(regexPattern)' }

Scenario: Register User
    Given path "api/register"
    And request { "email": "eve.holt@reqres.in", "password": "pistol" }
    When method POST
    Then status 200
    And match response == { id: '#notnull', token: '#notnull' }

Scenario: Register User - Unsuccessful
    Given path "api/register"
    And request { "email": "sydney@fife" }
    When method POST
    Then status 400
    And match response == { error: "Missing password" }

Scenario: Login - Successful
    Given path 'api/login'
    And request { 'email': 'eve.holt@reqres.in', 'password': 'cityslicka'}
    When method POST
    Then status 200
    And match response == { token: '#notnull' }


Scenario: Login - Unsuccessful
    Given path 'api/login'
    And request { 'email': 'juan.edu@sel.com'}
    When method POST
    Then status 400
    And match response == { 'error': 'Missing password' }

