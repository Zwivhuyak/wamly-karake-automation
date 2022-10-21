Feature: Partner API
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/userPush/scenario.csv')
    * def extractor = Java.type("common.Config");
    * def firstName = new extractor().faker().name().firstName();
    * def lastName = new extractor().faker().name().lastName();

  @OPENAPI
  Scenario Outline: Push user to the following organasation named : <scenarioDescription>
    Given url BaseUrl
    And path '<path>'
    * def apiKey = karate.get('apiKey', '<apiKey>')
    And header x-api-key = apiKey
    And call read('classpath:../Mailsac/createMailsacEmail.feature')
    * def body = read('classpath:baserequest/createUser.json')
    When request body
    And set body.organization = '<organizationId>'
    * def organizationId = '<organizationId>'
    And set body.email = email
    * def email = email
    And set body.role = '<scenarioDescription>'
    And set body.lastName = lastName
    And set body.firstName = firstName
    When method post
    Then status 200
    Then print response.message
    And call read('classpath:../Users/Positive/GetUser/GetUser.feature')
    Then match response.response.profile.email contains email
    Then match response.response.profile.lastName contains lastName
    Then match response.response.profile.firstName contains firstName

    Examples:
      |datasheet|