Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/userPull/scenario.csv')

  @OPENAPI
  Scenario Outline: Pull user from organasation named : <scenarioDescription>
    Given url BaseUrl
    And path '<path>'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    And param profileEmail = '<profileEmail>'
    Then method get
    Then print response
    Then match response.code contains '<status>'
    Then match response.message contains '<message>'

    Examples:
      |datasheet|