*** Settings ***
Documentation       Suite de testes de autenticação
...                 Administrador deve acessar o portal de gestão de academias

Resource            ../resources/base.resource


*** Test Cases ***
Login do administrador
    Go To Login Page
    Fill Credenciais    admin@smartbit.com    qacademy

    # Fill Text    css=input[name=email]    admin@smartbit.com
    # Fill Text    css=input[name=password]    qacademy

    # Duas formas diferentes para encontrar texto de um elemento:
    # Click    xpath=//button[text()="Entrar no sistema"]
    # Click    text=Entrar no sistema

    Submit Credenciais
    User Should Be Logged In    Admin

Email não cadastrado
    Go To Login Page
    Fill Credenciais    404@smartbit.com    qacademy
    Submit Credenciais
    Click    css=button >> text=Entrar no sistema
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha inválida
    Go To Login Page
    Fill Credenciais    admin@smartbit.com    abc123
    Submit Credenciais
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    Go To Login Page
    Fill Credenciais    @com.br    abc123
    Submit Credenciais
    Field Type Should Be Email

Senha em branco
    Go To Login Page
    Fill Credenciais    admin@smartbit.com    ${EMPTY}
    Submit Credenciais
    Alert Text Should Be    password    A senha é obrigatória

Email em branco
    Go To Login Page
    Fill Credenciais    ${EMPTY}    qacademy
    Submit Credenciais
    Alert Text Should Be    email    O e-mail é obrigatório

Email e senha são obrigatórios
    Go To Login Page
    Submit Credenciais
    Alert Text Should Be    email    O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória
