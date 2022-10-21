Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')

  @OPENAPI
  Scenario Outline: Get Departments from organasation named : <scenarioDescription>
    Given url BaseUrl
    And path 'departments'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    Then method get
    Then print response
    Then status 200

    Examples:
      |datasheet|