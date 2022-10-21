Feature: Testing DeleteAPI
  Background:
    * url BaseUrl
    * def body = read('classpath:baserequest/candidateSearch.json')
    * def datasheet = read('classpath:testData/Search/Candidate/scenario.csv')

    Scenario Outline: <scenarioDescription>

     Given path '<endpoint>'
      When request body
     * def username = '<requester>'
     * def password = '<Password>'
     When set body.organizationId = '<organizationId>'
      And  set body.department = '<department>'
     And call read('getToken.feature')
     And header Authorization = 'Bearer '+AccessToken
     When method post
      And print response
      Then status 200



      Examples:
      |datasheet|