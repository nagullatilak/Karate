Feature: sample2
@tag3
Scenario: 3rd
    * print "This is 3rd test"
@tagt4
Scenario: 4th
    * print "This is 4th test"
    * def result = call read('callonce.feature@tag1')
   

