Feature: Filter projects by multiple properties
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def generateResult = Java.type('common.RandomBoooleanGenerator')
  Scenario Outline: Filter projects by multiple properties
    Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/projects'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    * def isBlur = generateResult.generate()
    * def isHideCandidateDetails = generateResult.generate()
    * def isNotifyRaters = generateResult.generate()
    * def isNotifyAdmin = generateResult.generate()
    * def isIntroVideoUsed = generateResult.generate()
    * def isBreather = generateResult.generate()


    Then set bodys.blur = isBlur
    Then set bodys.hideCandidateDetails = isHideCandidateDetails
    Then set bodys.notifyRaters = isNotifyRaters
    Then set bodys.notifyAdmin = isNotifyAdmin
    Then set bodys.introVideoUsed = isIntroVideoUsed
    Then set bodys.breather = isBreather

    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].blur contains isBlur
    Then match response.response.data[*].hideCandidateDetails contains isHideCandidateDetails
    Then match response.response.data[*].notifyRaters contains isNotifyRaters
    Then match response.response.data[*].notifyAdmin contains isNotifyAdmin
    Then match response.response.data[*].introVideoUsed contains isIntroVideoUsed
    Then match response.response.data[*].breather contains isBreather
    Then match response.message == 'Projects searched successfully'
    And print response

    Examples:
      |datasheet|


