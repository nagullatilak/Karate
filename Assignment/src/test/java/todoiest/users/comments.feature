Feature: Comments
Background:
    * url baseUrl
Scenario: 'CRUD operations on Comments'
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

#Create a New Comments
Given path 'comments'
And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
And request
"""
{
    "task_id": '#(taskId)',
    "content": "Need two bottle of milk",
    "attachment": {
        "resource_type": "file",
        "file_url": "https://s3.amazonaws.com/domorebetter/Todoist+Setup+Guide.pdf",
        "file_type": "application/pdf",
        "file_name": "File.pdf"
    }
}
"""
When method POST
Then status 200
Then match response =='#object'
Then match response.content =='Need two bottle of milk'
* def commentId = response.id

#Get a Comment
Given path 'comments/'+commentId
And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'}
When method GET
Then status 200
Then match response =='#object'
Then match response.content =='Need two bottle of milk'

#Get all Comments
#Given path 'comments?task_id = '+taskId
#And param task_id = taskId
#And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'}
#When method GET
#Then status 200

#Update A Comment
Given path 'comments/'+commentId
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50',Content-Type:'application/json'}
    And request
    """
        {"content": "Need two bottles of milk"}
    """
    When method POST
    Then status 204
    
   
  
#Delete a Comment
Given path 'comments/'+commentId
    
    And headers {Authorization:'Bearer f37733bf81919803f8750a3c8dee04a86031fd50'}
    When method DELETE
    Then status 204
