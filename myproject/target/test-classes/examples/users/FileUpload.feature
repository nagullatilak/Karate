@debug
Feature: File Uplaod
Background: 
    * url 'https://filebin.net'
Scenario:File uplaod testcase
    Given path '/'
    And header Content-type = "image/png"
    And request karate.read("file:src/test/java/Screenshot from 2021-07-28 14-44-03.png")
    When method POST
    Then status 201