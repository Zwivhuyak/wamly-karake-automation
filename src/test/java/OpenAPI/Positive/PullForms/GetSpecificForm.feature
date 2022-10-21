Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')


  @OPENAPI
  Scenario Outline: Pull specific Forms from : <scenarioDescription>
    Given url BaseUrl
    And path 'form/120f8658-1fd5-4a7f-ba01-935413a23e00'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    Then method get
    Then status 200

    Examples:
      |datasheet|