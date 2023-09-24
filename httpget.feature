Feature: Using get requests

Background:
    * url 'https://reqres.in/'

Scenario: Get a list of users
    Given param page = 2
    And path 'api/users'
    When method GET
    Then status 200

    * def lengthData = response.per_page
    * def totalPages = response.total_pages + 1

    * def dataSchema =
    """
    {
        id: '#number',
        email: '#string',
        first_name: '#string',
        last_name: '#string',
        avatar: '#string'
    }
    """

    And match response ==
    """
    {
        'page': #number? _ < totalPages,
        'per_page': #number,
        'total': #number,
        'total_pages': #number,
        'data': '#[lengthData] dataSchema',
        'support': {
            'url': #string,
            'text': #string
        }
    }
    """

Scenario: Get a specific user
    Given path 'api/users/3'
    When method GET
    Then status 200

    * def dataSchema =
    """
    {
        id: '#number',
        email: '#string',
        first_name: '#string',
        last_name: '#string',
        avatar: '#string'
    }
    """

    Then match response ==
    """
    {
        'data': #(dataSchema),
        'support': {
            'url': #string,
            'text': #string
        }
    }
    """

Scenario: Get a single user not found
    Given path 'api/users/23'
    When method GET
    Then status 404
    And match response == {}
