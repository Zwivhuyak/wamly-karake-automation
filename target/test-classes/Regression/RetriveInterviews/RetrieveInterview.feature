Feature: Retrieve Interviews
  Background:
    * url BaseUrl
    * def datasheet = read('data.csv')

  @Regression
  Scenario Outline: Retrieve interviews from project name : <ProjectName>
    Given url 'https://api.uatwamly.co.za/wamly/v1//project/<OrgId>/project/<ProjectId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    Then match response.response.projectName contains '<ProjectName>'
    Then match response.response.projectId contains '<ProjectId>'
    Then match response.response.organizationId contains '<OrgId>'
    * def data = response.response.candidates
    * def myFun =
    """

  function(args){
  for(i=0;i<args.length;i++){
  return args[i]

  }
  }
    """
    * def name = call myFun data
    Then print name


    Examples:
    |datasheet|
