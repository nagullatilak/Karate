Feature: Projects
Background:
    * url baseUrl
Scenario: Projects
    Given path 'projects'
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method Get
    Then status 200

# Creating a new project
Given path 'projects'
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

#Get A Project
Given path 'projects/'+proId
And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50' 
    When method Get
    Then status 200
    Then match response == "#object"
    Then match response.id == proId 

#Update A Project
Given path 'projects/'+proId
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """
    {
        "name": "Things to Buy"
       }
    """
    When method POST
    Then status 204
    
   
  
#Delete a Project
Given path 'projects/'+proId
    
And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method DELETE
    Then status 204

#Get collaborators
Given path 'projects/2270367633/collaborators'
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method GET
    Then status 200


