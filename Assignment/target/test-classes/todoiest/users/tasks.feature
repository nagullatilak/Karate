Feature: Tasks
Background: 
    * url baseUrl
Scenario: CRUD On Tasks
    Given path 'tasks'
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method GET
    Then status 200

#Create a New Task
Given path 'tasks'
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
"""{"content": "Buy Milk", "due_string": "tomorrow at 12:00", "due_lang": "en", "priority": 4}
"""
    When method POST
    Then status 200
    Then match response =='#object'
    Then match response.content =='Buy Milk'
    * def taskId = response.id

#Get a Active Task
Given path 'tasks/'+taskId
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method GET
    Then status 200
    Then match response =='#object'
    Then match response.content =='Buy Milk'

#Update a Tasks
Given path 'tasks/'+taskId
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """
        {"content": "Buy Coffee"}
    """
    When method POST
    Then status 204

#Close a Task
Given path 'tasks/'+taskId+'/close'
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method POST
    Then status 204

#Reopen a task
Given path 'tasks/'+taskId+'/reopen'
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method POST
    Then status 204

#Delete a task
Given path 'tasks/'+taskId
    And header Authorization = 'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'
    When method DELETE
    Then status 204

