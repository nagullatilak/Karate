Feature: Labels
Background:
    * url baseUrl

Scenario:CRUD operations on Labels
#Get all Labels 
    Given path 'labels'
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method Get
    Then status 200

# Creating a new Label
Given path 'labels'
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """{"name": "Drinks"}
    """
    When method POST
    Then status 200
    Then match response == "#object"
    Then match response.name == "Drinks"
    * def labelId = response.id
    Then print  labelId

#Get A Label
Given path 'labels/'+labelId
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method Get
    Then status 200
    Then match response == "#object"
    Then match response.id == labelId

#Update A Label
Given path 'labels/'+labelId
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """
        {
            "name" : "Food"
        }
    """
    When method POST
    Then status 204
    
   
  
#Delete a Label
Given path 'labels/'+labelId
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method DELETE
    Then status 204