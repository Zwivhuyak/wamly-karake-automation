Feature: Create Users
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/createOrg/scenario.csv')
    * def extractor = Java.type("common.Config");
    * def firstName = new extractor().faker().name().firstName();
    * def lastName = new extractor().faker().name().lastName();

  Scenario Outline: Create Org on <Subscription> package
    Given url 'https://api.uatwamly.co.za/wamly/v1/organization'
    * def username = '<requesterEmail>'
    * def password = '<Password>'
    And call read('classpath:../Users/Positive/CreateUser/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    * def body = read('classpath:baserequest/createOrg.json')
    When request body
    Then print body


    Examples:
      |datasheet|