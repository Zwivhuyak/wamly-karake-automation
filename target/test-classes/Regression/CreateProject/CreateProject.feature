Feature: Create a Project
  Background:
    * def bodys01 = read('body.json')
    * def candidateJSON01 = read('candidate.json')
    * def datasheet01 = read('data.csv')
    * def extractor01 = Java.type("common.Config")
    * def date01 = new extractor01().todaysDateTime()
  Scenario Outline: Create Draft Project
    Given url 'https://api.uatwamly.co.za/wamly/v1//new/project'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When request bodys01
    Then bodys01.projectName = 'Project '+date01
   Then bodys01.templateId = karate.get('templateId','<templateId>')
    Then print '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    Then print bodys01
    Then print '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    Then method post
    * def organizationId = response.response.organizationId
    * def projectId = response.response.projectId
    Then url 'https://api.uatwamly.co.za/wamly/v1//add-candidates'
    And header Authorization = 'Bearer '+AccessToken
    When request candidateJSON01
    Then candidateJSON01.projectId = projectId
    Then candidateJSON01.organizationId = organizationId
    Then method put
    Then url 'https://api.uatwamly.co.za/wamly/v1//organization/'+organizationId+'/project/'+projectId+'/activate'
    And header Authorization = 'Bearer '+AccessToken
    Then method post
    Then status 200
    Then match response.message == 'Project Activated successfully'
    And print response

    * java.lang.Thread.sleep(5000)

    Examples:
    |datasheet01|

