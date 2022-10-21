# new feature
# Tags: optional

Feature: Getting the OTP

  Scenario: A scenario to get an OTP
    Given url 'https://mailsac.com/api/addresses/delete@mailsac.com/messages'
    And header Mailsac-Key = 'k_XBMIoKOf4PR8tsw2euxDEdVvFC8X0to8LADwf05e'
    When method get
    And print response
   Then status 200
  * def id = response[0]._id
    And print id
   Given url 'https://mailsac.com/api/body/delete@mailsac.com/'+id
    And header Mailsac-Key = 'k_XBMIoKOf4PR8tsw2euxDEdVvFC8X0to8LADwf05e'
    When method get
    And print response
    Then status 200
   * def extractor = Java.type("common.OtpExtract");
    * def OTP = new extractor().GetDeleteOTP(response)
    And print OTP

    