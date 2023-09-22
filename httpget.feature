Feature: Using get request

Background:
    * url 'https://reqres.in/'

Scenario: Get a list of users from an reqres.in
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

Scenario: Get a specific user from an reqres.in
    Given url "https://reqres.in/api/users/2"
    When method GET
    Then status 200
    Then match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
