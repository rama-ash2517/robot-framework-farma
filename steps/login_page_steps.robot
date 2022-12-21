*** Settings ***
Library         SeleniumLibrary
Resource        ../pages/login_page.robot

*** Keywords ***
User login with email "${email}" and password "${password}"
    Input Email                     ${email}
    Input Correct Password          ${password}
    Click Button Sign In
    Success Login is Displayed
