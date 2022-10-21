Feature: Retrive Users
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')

  Scenario Outline: Get users in the organization
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/users/fe187821-ca80-40c5-b265-9f24ab3754dd'
    * def username = '<requesterEmail>'
    * def password = '<Password>'
    And call read('classpath:../Users/Positive/CreateUser/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then status 200
    Then match response.message contains 'Organization Users Found'



    Examples:
      |datasheet|