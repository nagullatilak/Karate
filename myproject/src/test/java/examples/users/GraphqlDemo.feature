@debug
Feature: Graphql Demo
Background: 
    * url 'https://api.graphql.jobs'
Scenario:Getting data
    Given path "/"
    Given text query=
    """ query{
        jobs{
            id ,title
        }
   }
    """
    And request { query : '#(query)'} 
    When method POST
    Then status 200
    Then match response == "#object"