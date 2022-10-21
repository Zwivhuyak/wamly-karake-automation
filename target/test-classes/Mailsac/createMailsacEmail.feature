Feature: Create a Random Email

  Scenario: Create a Random Email
    * def extractor = Java.type("common.Config");
    * def email = new extractor().mailsacEmail()

    Given url 'https://mailsac.com/inbox/'+email
    And header Mailsac-Key = 'k_XBMIoKOf4PR8tsw2euxDEdVvFC8X0to8LADwf05e'
    When method get

