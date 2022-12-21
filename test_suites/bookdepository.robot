*** Settings ***
Library           SeleniumLibrary
Resource          ../setups/resources.robot
Resource          ../steps/main_home_page_steps.robot
Resource          ../steps/login_page_steps.robot
Test Setup        Open Home Page
Test Teardown     Close Browser


*** Test Cases ***
Scenario: User search book and sort the price from lowest to high
    [Tags]      Case1
    Given user already in main home page
    And user click Sign in button
    And user login with email "${VALID_EMAIL}" and password "${VALID_PASSWORD}"
    When user search "Supernova"
    And user select sort "Price, low to high"
    Then user see the sort filter is "Price, low to high"

Scenario: User can update decrease or increate qty item on the cart
    [Tags]      Case2
    Given user already in main home page
    And user click Sign in button
    And user login with email "${VALID_EMAIL}" and password "${VALID_PASSWORD}"
    When user search "Supernova"
    And user select the first item to the basket
    And user go to basket/cart page
    And user update the qty to "5"
    Then user verify the qty of item is "5"
    And user update the qty to "2"
    And user verify the qty of item is "2"
    And user remove item from basket

Scenario: User can add item to the wishlist
    [Tags]      Case3
    Given user already in main home page
    And user click Sign in button
    And user login with email "${VALID_EMAIL}" and password "${VALID_PASSWORD}"
    When user search "Supernova"
    And user click the first item to the detail page
    And user click wishlist button
    And user input wishlist name "Pesananku"
    Then user see the item appear on the wishlist page
