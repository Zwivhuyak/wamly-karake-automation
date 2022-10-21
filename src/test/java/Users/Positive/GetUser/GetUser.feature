Feature: Retrive User
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/users/scenario.csv')

  Scenario Outline: Get user in the organization
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/'+organizationId+'/user/'+email+'/profile'
    * def username = '<requesterEmail>'
    * def password = '<Password>'
    And call read('classpath:../Users/Positive/CreateUser/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then status 200
    Then match response.message contains 'User Profile Found'
    Then match response.response.profile.email contains ''

    Examples:
    |datasheet|