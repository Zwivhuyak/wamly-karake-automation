Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/interview/scenario.csv')
    * def extractor = Java.type("common.Config");
    * def date = new extractor().todaysDateTime();

  @OPENAPI
  Scenario Outline: Get Interview From the Following project : <projectName>
    Given url BaseUrl
    And path 'project/<projectId>/candidate/<candidateEmail>/link'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    * def body = read('classpath:baserequest/pushProject.json')
    And header x-api-key = apiKey
    Then method get
    Then match response.code contains '<status>'
    Then match response.message contains '<message>'


    Examples:
      |datasheet|