*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${MAIN_PAGE}                  https://www.bookdepository.com/
${BROWSER}                    Chrome
${VALID_EMAIL}                rama.ash2517@gmail.com
${VALID_PASSWORD}             Password11

*** Keywords ***
Open Home Page
  Open Browser    ${MAIN_PAGE}    ${BROWSER}
  # Maximize Browser Window