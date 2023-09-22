Feature: Get users from an API

Scenario: Get a list of users from an reqres.in
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200

Scenario: Get a specific user from an reqres.in
    Given url "https://reqres.in/api/users/2"
    When method GET
    Then status 200
    Then match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
