Feature: Json Schema
Background:
Scenario:"JSON Schema"
    Given url 'https://reqres.in/api/2'
    When method Get
    Then match response == '#object'
    * def jsonSchemaExpected =
    """
        {
            "data":{
                "id":'#number',
                "email":"#string",
                "first_name":"#string",
                "last_name":"#string",
                "avatar" : "#string"
            },
            "support" :{
                "url" : "#string",
                "text" : "#string"
            }
        }
    """
 * match response ==jsonSchemaExpected