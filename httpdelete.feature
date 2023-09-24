Feature: Using Delete Request

Background:
    * url 'https://reqres.in/'

Scenario: Deleting an specific user
    Given path 'api/users/2'
    When method DELETE
    Then status 204
    And match response == ''
