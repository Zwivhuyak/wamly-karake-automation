Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')


  @OPENAPI
  Scenario Outline: Pull Forms from : <scenarioDescription>
    Given url BaseUrl
    And path 'forms'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    Then method get
    Then status 200

    Examples:
      |datasheet|