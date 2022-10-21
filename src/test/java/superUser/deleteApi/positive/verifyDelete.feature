# new feature
# Tags: optional

Feature: Verify A delete
  Background:
    * url BaseUrl
  Scenario: A scenario to Verify a delete
    Given path '/auth/otp/verify/delete@mailsac.com/'+OTP
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And print response
    Then match response.response.requester contains 'delete@mailsac.com'
    Then match response.response.status contains 'PENDING_APPROVAL'
#    Then match response.response.target contains target
    And print response
