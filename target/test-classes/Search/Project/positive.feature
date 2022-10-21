Feature: Testing DeleteAPI
  Background:
    * url BaseUrl
    * def body = read('classpath:baserequest/projectSearch.json')
    * def datasheet = read('classpath:testData/Search/Project/scenario.csv')

    Scenario Outline: <scenarioDescription>

     Given path '<endpoint>'
      When request body
     * def username = '<requester>'
     * def password = '<Password>'
     When set body.organizationId = '<organizationId>'
      And  set body.projectName = '<projectName>'
      And  set body.notifyAdmin = true
     And call read('getToken.feature')
     And header Authorization = 'Bearer '+AccessToken
     When method post
      Then status 200
      And print response


      Examples:
      |datasheet|