Feature:Sections
Background:
    * url baseUrl
Scenario: Todoiest Sections
Given path 'sections'
    And param project_id = "2270367633"
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method GET
    When status 200

#Create a new section
Given path 'sections'
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """{"project_id":2270367633, "name":"Groceries"}
    """
    When method POST
    Then status 200
    Then match response == '#object'
    Then match response.name == 'Groceries'
    * def sectionId = response.id

#Get a single section
Given path 'sections/'+sectionId
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method GET
    Then status 200
    Then match response =='#object'
    Then match response.name =='Groceries'

#Update a section
Given path 'sections/'+sectionId
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """
    {
        "name":"Supermarket"
    }
    """
    When method POST
    Then status 204

#Delete A Section
Given path 'sections/'+sectionId
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method DELETE
    Then status 204

