*** Settings ***
Library         SeleniumLibrary
Resource        ../pages/main_home_page.robot

*** Keywords ***
User already in main home page
    Main Home Page is Displayed

User click Sign in button
    Click Sign In Button

User search "${keyword}"
    Input Search    ${keyword}
    Click Button Search

user select sort "${sort}"
    Select Sort Button    ${sort}

user see the sort filter is "${sort}"
    Get Label Sort Filter    ${sort}

user select the first item to the basket
    Add to Basket First Item

user go to basket/cart page
    Click Basket/Checkout Button

user update the qty to "${qty}"
    Update Qty on Basket Page    ${qty}

user verify the qty of item is "${qty}"
    Get Text Qty Label  ${qty}

user remove item from basket
    Click Remove Item on Basket

user click the first item to the detail page
    Click Item to go to Detail page

user click wishlist button
    Click Wishlist Button

user input wishlist name "${wishlistName}"
    Input WishList Name    ${wishlistName}
    Click Add WishList Button
    Click Close Button

user see the item appear on the wishlist page
    Click WishList Menu
    Get Wishlist Item
    Click Edit Wishlist
    Click Remove Wishlist