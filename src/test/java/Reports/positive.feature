Feature: Testing DeleteAPI
  Background:
    * url BaseUrl
    * def body = read('classpath:baserequest/reportReq.json')
    * def datasheet = read('classpath:testData/report/scenario.csv')

    Scenario Outline: <scenarioDescription>

     Given path '<endpoint>'
      When request body
     * def username = '<requester>'
     * def password = '<Password>'
     When set body.organizationId = '<organizationId>'
     And call read('getToken.feature')
     And header Authorization = 'Bearer '+AccessToken
     When method post
      Then status 200
      And print response
      And call read('<scenarioDescription>'+'.feature')

      Examples:
      |datasheet|