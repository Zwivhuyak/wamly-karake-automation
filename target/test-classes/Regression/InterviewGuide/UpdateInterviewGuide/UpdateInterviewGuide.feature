Feature:  Update Interview Guide
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def objectt = Java.type('common.AddDate')
    * def datee = objectt.addDate()

    @Regression
    Scenario Outline: Update Guide
      Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/updateInterviewGuide/<userId>'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken


      Then bodys.title = '<title>'+ datee
      Then bodys.description = '<description>'
      Then bodys.status = '<status>'
      Then bodys.questionDTOS[0].id = '<qId>'
      Then bodys.questionDTOS[0].question = '<question>'
      Then bodys.questionDTOS[0].responseTime = <responseTime>
      Then bodys.questionDTOS[0].preparationTime = <preparationTime>

      When request bodys
      Then method put
      * def name = bodys.title
      * def result = call read('classpath:../Regression/InterviewGuide/GetInterviewGuides/getInterviewGuides.feature')
      * def id = result.response.response
      * def fun = function() {for(var i = 0; i < id.length;i++){if(result.response.response[i].interviewGuideTitle === name)return result.response.response[i].interviewGuideTitle;}}
      And status 200
      And match result.response.response[*].interviewGuideTitle contains fun()
      And match response.message == 'Update Successful'
      And print response

      Examples:
      |datasheet|