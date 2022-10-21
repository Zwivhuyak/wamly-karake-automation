Feature: UI Automation
  Scenario: Wamly
    
    Given driver "https://google.com"
    And input('input[name=q]','zwivhuya')
    And click('input[name=btnK]')
    And waitForUrl('https:\\ui.uatwamly.co.za')