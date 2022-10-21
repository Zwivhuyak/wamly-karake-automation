Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')

  @OPENAPI
  Scenario Outline: Get Specific Interview Guides from organasation named : <scenarioDescription>
    Given url BaseUrl
    And path 'interviewGuide/62d38616-310f-4b1d-8976-057a5034348b'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    Then method get
    Then print response
    Then status 200

    Examples:
      |datasheet|