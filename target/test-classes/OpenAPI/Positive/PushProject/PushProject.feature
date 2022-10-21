Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')
    * def extractor = Java.type("common.Config");
    * def date = new extractor().todaysDateTime();

  @OPENAPI
  Scenario Outline: Push Project from Partner API : <scenarioDescription>
    Given url BaseUrl
    And path 'project'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    * def body = read('classpath:baserequest/pushProject.json')
    And header x-api-key = apiKey
    When request body
    And set body.projectName = 'Partner-API '+date
    Then method post
    Then print response
    Then status 201
    Then match response.message contains 'Project saved as draft'

    Examples:
      |datasheet|
