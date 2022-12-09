*** Settings ***
Documentation       Representaçãodo componente toast

Library             Browser


*** Keywords ***
Verify Toaster
    [Arguments]    ${expected_nessage}

    Wait For Elements State
    ...    css=.Toastify__toast-body div >> text=${expected_nessage}
    ...    visible    5

    Wait For Elements State
    ...    css=.Toastify__toast-body div
    ...    detached    10
