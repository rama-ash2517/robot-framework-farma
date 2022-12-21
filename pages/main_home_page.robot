*** Settings ***
Library         SeleniumLibrary
Library         Process

*** Variables ***
${IMG_LOGO}                 class:brand-link
${SIGN_IN}                  link:Sign in/Join
${INPUT_SEARCH}             name:searchTerm
${BUTTON_SEARCH}            class:header-search-btn
${COMBOBOX_SORT}            name:searchSortBy
${BUTTON_ADD_TO_BASKET}     class:book-item:first-of-type>div.item-actions>div>a
${SELECT_FIRST_ITEM}         class:book-item:first-of-type>div.item-img
${BUTTON_CHECKOUT}          link:Basket / Checkout
${SELECT_QTY}               Qty_0
${REMOVE_BUTTON}            xpath://button[@class="btn remove-btn"]
${SELECTED_QTY}             xpath://option[@selected=""]
${BUTTON_WISHLIST}          link:Add to wishlist
${INPUT_WISHLIST_NAME}      name:wishlistLabel
${BUTTON_ADD_WISHLIST}      class:btn.btn-primary.pull-right
${BUTTON_CLOSE}             class:close>span
${BUTTON_WISHLIST_MENU}     link:Wishlist
${LABEL_WISHLIST_ITEM}      class:item-title>a
${BUTTON_EDIT_WISHLIST}     class:btn-edit-text
${BUTTON_REMOVE_WISHLIST}   link:Delete wishlist
${wishlist_Item}            Supernova

*** Keywords ***
Main Home Page is Displayed
    Wait Until Element Is Visible    ${IMG_LOGO}
    Element Should Be Visible        ${IMG_LOGO}

Click Sign In Button
    Wait Until Element Is Visible    ${SIGN_IN}
    Click Link                       ${SIGN_IN}

Input Search
    [Arguments]     ${keyword}
    Input Text      ${INPUT_SEARCH}    ${keyword}

Click Button Search
    Click Button    ${BUTTON_SEARCH}

Select Sort Button
    [Arguments]     ${sort}
    Select From List By Label    ${COMBOBOX_SORT}   ${sort}

Get Label Sort Filter
    [Arguments]     ${sort}
    Wait Until Page Contains    ${sort}

Add to Basket First Item
    Click Link    ${BUTTON_ADD_TO_BASKET}
    Sleep    3s

Click Basket/Checkout Button
    Click Link    ${BUTTON_CHECKOUT}
    Sleep    3s

Update Qty on Basket Page
    [Arguments]     ${qty}
    Select From List By Value    ${SELECT_QTY}      ${qty}
    Sleep    3s

Get Text Qty Label
    [Arguments]     ${qty}
    Element Text Should Be    ${SELECTED_QTY}    ${qty}

Click Remove Item on Basket
    Click Button    ${REMOVE_BUTTON}
    Wait Until Element Is Not Visible    ${REMOVE_BUTTON}

Click Item to go to Detail page
    Click Element    ${SELECT_FIRST_ITEM}
    
Click Wishlist Button
    Click Element    ${BUTTON_WISHLIST}
    Sleep    3s
    
Input WishList Name
    [Arguments]     ${wishlistName}
    Input Text      ${INPUT_WISHLIST_NAME}    ${wishlistName}
    
Click Add WishList Button           
    Click Element    ${BUTTON_ADD_WISHLIST}
    Sleep    3s

Click Close Button
    Click Element    ${BUTTON_CLOSE}
    Sleep    3s

Click WishList Menu
    Click Element    ${BUTTON_WISHLIST_MENU}

Get Wishlist Item
    Element Text Should Be    ${LABEL_WISHLIST_ITEM}    ${wishlist_Item}

Click Edit Wishlist
    Click Element    ${BUTTON_EDIT_WISHLIST}
    Sleep    3s

Click Remove Wishlist
    Click Element    ${BUTTON_REMOVE_WISHLIST}
    Handle Alert     ACCEPT