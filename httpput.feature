Feature: Using put requests

Background:
    * url 'https://reqres.in/'

Scenario: Updating a user with put request
    Given path 'api/users/2'
    And request { 'name': 'Morpheus', 'job': 'Resident' }
    When method PUT
    Then status 200
    * def regexPattern = '#regex ^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$'
    And match response == { 'name': #string, 'job': #string, 'updatedAt': #(regexPattern) }

