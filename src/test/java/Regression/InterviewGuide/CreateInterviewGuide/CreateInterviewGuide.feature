Feature: Create Interview Guide
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def objectt = Java.type('common.AddDate')
    * def datee = objectt.addDate()

  @Regression
  Scenario Outline: Create new interview guide
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/interviewguide'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken


    Then bodys.description = '<description>'
    Then bodys.status = '<status>'
    * def j = Java.type('common.EmailTemplates')
    * def bodys2 = j.emailContent()
    * def temp = karate.fromString(bodys2)
    Then temp.title = '<title>'+ datee
    * def name = temp.title
    Then request temp
    Then method post

    * def result = call read('classpath:../Regression/InterviewGuide/GetInterviewGuides/getInterviewGuides.feature')
    * def id = result.response.response
    * def fun = function() {for(var i = 0; i < id.length;i++){if(result.response.response[i].interviewGuideTitle === name)return result.response.response[i].interviewGuideTitle;}}
    And status 201
    And match result.response.response[*].interviewGuideTitle contains fun()
    And match response.message == 'Interview Guide Created'
    And print response
    Examples:
    |datasheet|
