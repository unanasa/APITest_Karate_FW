#Author: Sachitha
#Date: 15/11/2022
Feature: Assurity Sandbox API Acceptance Criterias

  Background: 
    * url 'https://api.tmsandbox.co.nz'
    * path '/v1/Categories/6327/Details.json'
    * param catalogue = 'false'
    * header Accept = 'application/json'

  Scenario: Validate Name value
    When method GET
    Then status 200
    And match $.Name == "Carbon credits"
    And print response

  Scenario: Validate CanRelist value
    When method GET
    Then status 200
    And match $.CanRelist == true
    And print response

  Scenario: Validate that Gallery has description with Good position in category
    When method GET
    Then status 200
    And match response.Promotions[1] == {"Id": '#ignore',"Name": "Gallery","Description": "Good position in category","Price": '#ignore',"OriginalPrice": '#ignore',"MinimumPhotoCount": '#ignore'}
    And print response
