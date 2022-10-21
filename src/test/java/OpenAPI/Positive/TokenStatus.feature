Feature: Disable Token
  Background:
    * url BaseUrl = 'https://api.uatwamly.co.za/wamly/v1'
    * def datasheet = read('classpath:testData/openAPI/tokenStatus.csv')
    * def body = read('classpath:baserequest/disableToken.json')
    * def extractor = Java.type("common.Config");
    * def date = new extractor().todaysDateTime();

  Scenario Outline: Change status of the token to : <status>

    Given url BaseUrl
      And path '<path>'
    Then print BaseUrl
    * def username = '<requesterEmail>'
    * def password = '<Password>'
    And call read('getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    And header ContentType = 'application/json'
    When request body
    And set body.orgId = '<organizationId>'
      And set body.status = '<status>'
    When method put
    Then status 200
    Then match response.message contains '<message>'
    And call read('classpath:../OpenAPI/Positive/CandidatePull/pullCandidate.feature')
    Then print response
    Then match response.code contains '<secondStatus>'


    Examples:
      |datasheet|