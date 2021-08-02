Feature: Call Scenario from another Scenario
Background:
    * url "https://api.todoist.com/rest/v1/"
@tag1 @ignore
Scenario: A
    Given path 'projects'
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'}
    When method Get
    Then status 200

@tag2
Scenario: B
Given path 'projects'
    * def result = call read('callonce.feature@tag1')
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """{"name":"Shopping List"}
    """
    When method POST
    Then status 200
    Then match response == "#object"
    Then match response.name == "Shopping List"
    * def proId = response.id
    Then print proId