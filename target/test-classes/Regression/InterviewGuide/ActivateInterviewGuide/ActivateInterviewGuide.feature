Feature: Deactivate Guide
  Background:
    * def datasheet = read('data.csv')


  @Regression
  Scenario Outline: Activate Interview Guide
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/updateguidestatus/<Id>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken


    Then method put
    * def result = call read('classpath:../Regression/InterviewGuide/GetInterviewGuides/getInterviewGuides.feature')
    * def id = result.response.response
    * def fun = function() {for(var i = 0; i < id.length;i++){if(result.response.response[i].id === '<Id>')return result.response.response[i].status;} }
    And status 200
    And match response.message == 'Interview Guide status changed to ' + fun() + ' successfully'
    And print response
    Examples:
      |datasheet|