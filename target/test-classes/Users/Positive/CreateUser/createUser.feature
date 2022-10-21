Feature: Create Users
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')
    * def extractor = Java.type("common.Config");
    * def firstName = new extractor().faker().name().firstName();
    * def lastName = new extractor().faker().name().lastName();

    @smoke
    Scenario Outline: Create user with <scenarioDescription> role
      Given url 'https://api.uatwamly.co.za/wamly/v1//add/user'
      * def username = '<requesterEmail>'
      * def password = '<Password>'
      And call read('getToken.feature')
      And call read('classpath:../Mailsac/createMailsacEmail.feature')
      And header Authorization = 'Bearer '+AccessToken
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
      Then print response
      Then print response.message
      And call read('classpath:../Users/Positive/GetUser/GetUser.feature')
      Then match response.response.profile.email contains email
      Then match response.response.profile.lastName contains lastName
      Then match response.response.profile.firstName contains firstName





      Examples:
        |datasheet|
