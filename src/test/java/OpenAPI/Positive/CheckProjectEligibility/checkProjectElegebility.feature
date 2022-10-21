Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')
    * def extractor = Java.type("common.Config");
    * def date = new extractor().todaysDateTime();

  @OPENAPI
  Scenario Outline: Check Project Elegebility : <scenarioDescription>
    Given url BaseUrl
    And path 'project/3a682adc-f7a6-4f26-bd9e-9f2b09bffc65/activate/eligibility'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    * def body = read('classpath:baserequest/pushProject.json')
    And header x-api-key = apiKey
    Then method get
    Then status 200
    Then response.message == 'Project is eligible for activation'

    Examples:
    |datasheet|