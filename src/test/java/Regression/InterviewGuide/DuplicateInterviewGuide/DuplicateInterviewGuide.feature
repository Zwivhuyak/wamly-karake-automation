Feature:  Duplicate Interview Guide
  Background: 
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

    @Regression
    Scenario Outline: Duplicate the interview guide
      Given url 'https://api.uatwamly.co.za/wamly/v1//organization/cloneguide'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken

      Then bodys.organizationId = '<organizationId>'
      Then bodys.interviewGuideId[0] = '<interviewGuideId>'
      Then request bodys
      Then method put
      Then status 200
      Then print response

      * def result = response.response
#      And print '*-*-***-***-***-***'
#      And print result
#      * def result = call read('classpath:../Regression/InterviewGuide/GetInterviewGuides/getInterviewGuides.feature')
#      * def id = result.response.response
#      * def fun = function() {for(var i = 0; i < id.length;i++){if(result.response.response[i].interviewGuideTitle === name)return result.response.response[i].interviewGuideTitle;}}
#
      Examples: 
      |datasheet|
