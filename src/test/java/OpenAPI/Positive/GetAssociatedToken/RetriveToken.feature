Feature: Retrieve Token
  Background:
    * url BaseUrl
  @OPENAPI
  Scenario Outline: Request access token

    Given url 'https://api.uatwamly.co.za/wamly/v1//token/'+'<organizationId>'
    * def username = '<requesterEmail>'
    * def password = '<Password>'
    And call read('classpath:../Users/Positive/CreateUser/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    Then match response.message contains 'Token retrieved'

    Examples:

      |requesterEmail|Password|organizationId|
      |lucky011@cmdq.co.za|P@ssword1|178f8bec-8169-409c-9a74-94532f63b560         |