Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')

  @OPENAPI
  Scenario Outline: Get specific intro Videos : <scenarioDescription>
    Given url BaseUrl
    And path 'intro/video/a6c21296-5104-4375-90b5-07517adfc0ca'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    Then method get
    Then print response
    Then status 200

    Examples:
      |datasheet|