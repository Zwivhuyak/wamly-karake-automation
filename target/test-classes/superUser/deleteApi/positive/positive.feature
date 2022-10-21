Feature: Testing DeleteAPI
  Background:
    * url BaseUrl
    * def body = read('classpath:baserequest/DeleteRequest.json')
    * def datasheet = read('classpath:testData/deleteApi/positive/INT/scenario.csv')

    Scenario Outline: <scenarioDescription>
     Given path '<endpoint>'
      When request body
     * def username = '<requester>'
     * def password = '<Password>'
     When set body.organizations[0] = '<organizationId>'
     And  set body.requester = '<requester>'
     And set body.target = '<target>'
     And set body.candidateId = '<candidateId>'
     And set body.userId = '<userId>'
     And call read('getToken.feature')
     And header Authorization = 'Bearer '+AccessToken
     When method post
      Then status 200
      And print response
      And match response.response.organizations contains any ['<organizationId>']
      And match response.response.requester contains '<requester>'
      And match response.response.target contains '<target>'
      And match response.message contains '<message>'
      * def deleteRequestId = response.response.id
      * def target = '<target>'
      And print deleteRequestId
      * java.lang.Thread.sleep(600)
      And call read('otp.feature')
      And call read('verifyDelete.feature')
      Examples:
      |datasheet|