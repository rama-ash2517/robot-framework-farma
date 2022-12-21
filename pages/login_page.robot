*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${INPUT_EMAIL}              ap_email
${INPUT_PASSWORD}           ap_password
${BUTTON_SIGN_IN}           signInSubmit
${LABEL_SIGN_IN_SUCCESS}    css:div[role='alert'] strong
${SIGN_IN_FRAME}            class:signin-iframe


*** Keywords ***
Login Page Displayed
    Wait Until Element Is Visible       ${INPUT_EMAIL}
    Element Should Be Visible           ${INPUT_EMAIL}

Input Email
    [Arguments]     ${email}
    Select Frame                        ${SIGN_IN_FRAME}
    Wait Until Element Is Visible       ${INPUT_EMAIL}
    Input Text      ${INPUT_EMAIL}      ${email}

Input Correct Password
    [Arguments]     ${password}
    Input Text      ${INPUT_PASSWORD}   ${password}

Click Button Sign In
    Click Button                        ${BUTTON_SIGN_IN}
    Unselect Frame

Success Login is Displayed
    Wait Until Element Is Visible       ${LABEL_SIGN_IN_SUCCESS}
    Element Should Be Visible           ${LABEL_SIGN_IN_SUCCESS}
    Element Text Should Be              ${LABEL_SIGN_IN_SUCCESS}    Welcome back