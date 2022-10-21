Feature: Accounts Delete
  Background:
    * def requestBody = read('requester.json')
    * def org = read('org.json')
    * def datasheet = read('data.csv')
  Scenario Outline: Delete Clients

    Given url 'https://api.uatwamly.co.za/wamly/v1/request/delete'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Regression/CreateOrganasation/CreateOrganisation.feature')
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When request requestBody
    Then set requestBody.organizations[] = new_org_id
    Then method post
    Then print response
    Then status 200
    Then match response.message == 'Delete requested. Verification pending'
    * java.lang.Thread.sleep(4000)
    And call read('otp.feature')
    Then url 'https://api.uatwamly.co.za/wamly/v1//auth/otp/verify/superuser1@mailsac.com/'+OTP
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then print response
    Then status 200
    Then match response.message == 'Verification Successful'
    * java.lang.Thread.sleep(4000)
    And call read('link.feature')
    Then driver (link)
    Then url 'https://api.uatwamly.co.za/wamly/v1/trigger/archiver'
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then url 'https://api.uatwamly.co.za/wamly/v1//backoffice/client'
    And header Authorization = 'Bearer '+AccessToken
    Then request org
    Then method post
    Then match response.response[*].id !contains 'b4074ef3-ff47-479a-bfe5-bc120d4ebaf0'





    Examples:
      |datasheet|
