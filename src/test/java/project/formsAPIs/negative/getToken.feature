# new feature
# Tags: optional

Feature: A description
  Background:
    * def body = read('classpath:baserequest/generateToken.json')
  Scenario: A scenario to get the token
    Given url 'https://ob4tlf46j7.execute-api.eu-west-1.amazonaws.com/default/GetToken'
    When request body
    And body.USERNAME = username
    And body.PASSWORD = password
    And body.USERPOOL_ID = user_pool
    And body.CLIENT_ID = client_id
    When method post
    Then status 200
    And print response
    * def AccessToken = response.AuthenticationResult.IdToken
    And print AccessToken
