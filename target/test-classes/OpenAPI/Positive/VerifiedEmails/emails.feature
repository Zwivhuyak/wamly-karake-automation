Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/userPull/scenario.csv')

  @OPENAPI
  Scenario Outline: Pull Verified Emails
    Given url BaseUrl
    And path 'custom/verified/mails'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    Then method get
    Then print response
    Then status 200


    Examples:
      |datasheet|