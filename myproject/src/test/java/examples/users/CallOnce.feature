Feature: call once
@tag1
Scenario:
    * print 'this is 1st test'
@tag2
Scenario:
    * print 'this is second test'
    * def result =call read('CallOnce.feature@tag1')