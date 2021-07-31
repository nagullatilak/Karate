
Feature: Get the details of user 2

Background:
  * url 'https://reqres.in/api'

Scenario: get the details of user 2
  Given path 'users'
  And param id = "2"
  When method get
  Then status 200
  Then match response.page == 2
Scenario: Create a Person
    Given path 'users'
    And request
       """
        {
            "name" :  "Tilak",
            "job"  : "QA"
        }
        """
    When method POST
    Then status 201
   
    Then match response == "#object"
    Then match response.name == "Tilak"
    * def userId = response.id
    Given path "users/"+userId
    When method Get
     #  Then status 200
    #Then match response.name == "Tilak"
    # update a person
    Given path 'users/'+userId
    And request
       """
        {
            "name" :  "SAI",
            "job"  : "QA"
        }
        """
    When method PETCH
    Then status 201
    Then match response == "#object"
    Then match response.name == "SAI"