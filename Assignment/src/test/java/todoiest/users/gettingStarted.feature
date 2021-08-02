Feature: Getting Started
Background:
    * url baseUrl
Scenario: Getting Started
Given path 'projects'
    And header Authorization = token
    When method Get
    Then status 200

#Adding a New Project
Given path 'projects'
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """{
    "name" : "Shopping List"
    }    
    """
    When method POST
    Then match response == "#object"
    Then match response.name == "Shopping List"
    * def projectId = response.id
    * call read('projects.feature') {project_Id: '#(projectId)'}
    Then status 200
    * print 'projectId---------------------------------------------'+project_Id

#Adding a New Task
Given path 'tasks'
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """
    {
    "content": "Buy Milk", 
    "project_id": '#(projectId)'
    }
    """
    When method POST
    Then match response == "#object"
    Then match response.content == "Buy Milk"
    Then status 200
    * def taskId = response.id

#Update the task
Given path 'tasks/'+taskId
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """
    {"due_string": "tomorrow"}
    """
    When method POST
    Then status 204

#Completing the task
Given path 'tasks/'+taskId+'/close'
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method POST
    Then status 204

#Delete A Project
Given path 'projects/'+projectId
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method DELETE
    Then status 204