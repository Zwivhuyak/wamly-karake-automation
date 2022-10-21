Feature: Request Token
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/openAPI/positive/scenario.csv')

  Scenario Outline: Request access token
    
    Given url 'https://api.uatwamly.co.za/wamly/v1/generate/token/' + '<organizationId>' + '/'+'<requesterEmail>'
    * def username = '<requesterEmail>'
    * def password = '<Password>'
    And call read('getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 201

    Examples:
      |datasheet|
    
    