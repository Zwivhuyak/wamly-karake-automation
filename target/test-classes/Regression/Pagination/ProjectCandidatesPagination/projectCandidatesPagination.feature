Feature: Displaying list of all candidates accordingly per page
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def cand = Java.type('common.CalculateCandidatesInProject')

    Scenario Outline: List of all Candidates pagination
      Given url 'https://api.uatwamly.co.za/wamly/v1/page/project/candidates'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken

      Then request bodys
      Then method put
      Then status 200
      And print response

#      Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/project/<projectId>'
#      And call read('classpath:../Authentication/getToken.feature')
#      And header Authorization = 'Bearer '+ AccessToken
#
#      Then method get

#      * def rr = response.response
#      * def candi = cand.getSizeOfCandidates(rr)
#      And print '/-----------//-/---/-/-/--//-'
#      And print rr
#      And print '/-----------//-/---/-/-/--//-'

      Examples:
      |datasheet|