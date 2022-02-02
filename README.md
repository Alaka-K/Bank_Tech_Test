# Bank tech test 
Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time. This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.


## Specification

### Requirements
* You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria
**Given** a client makes a deposit of 1000 on 10-01-2023
**And** a deposit of 2000 on 13-01-2023
**And** a withdrawal of 500 on 14-01-2023
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00

```

### User stories


-[x]
> As a Bank
> So that a client can deposit and withdraw thier own money   
> I would like each account to start with a balance of 0   

-[x]
> As a Bank   
>So that clients can only withdraw money that they have deposited   
>I would like withdrawals to only happen if the client has sufficient funds   

-[x]
> As a client
> So that I can have a place to store my money 
> I would like to create an account

-[x]
> As a client
> So that I can save my money in my account
> I would like to to be able to deposit money into that account

-[x]
> As a client
> So that I can spent my money 
> I would like to to be able to withdraw money


-[x]
> As a client
> So that I can see a record of my transactions  
> I would like to print my account statment


-[x]
> As a client
> So that I can keep track of when a transactions was made
> I would like to print my account statement with the date of each transaction

-[x]
> As a client
> So that I can keep track of exactly which type of transaction was made
> I would like to print my account statement with the date of each transaction, credit, debit and balance



| Class       | Attributes   |Methods        |
| ----------- | ----------- |----------------|
| Account     | @balance = 0|      deposit   |
|             |   @credit   |     withdrawal |
|             |   @debit    |                |
|             |@transactions|                |


| Class             | Attributes  |Methods         |
| ------------------| ------------|----------------|
| Account_Statement | @account    |print_statement |
|                   |             |                |


### Update on my work so far

Please clone repo and bundle install

```
 > irb
 >require './lib/account'
 => true
 >require './lib/account_statement'
 => true
```
First I create an account and deposit some money

```
 > account = Account.new
 => #<Account:0x00007fb51728d1a0 @balance=0, @date="02/02/2022", @transactions=[]>
 > account.deposit(32)
 => ["02/02/2022 || 32.00 || || 32.00"]
 > account.deposit(50.25)
 => ["02/02/2022 || 32.00 || || 32.00", "02/02/2022 || 50.25 || || 82.25"]
```
Then initialize an account_statement class, passing the account as an argument

```
 > statement = Account_Statement.new(account)
 => #<AccountStatement:0x00007fb517146918
...
```

Then I print the statement

 ```
> statement.print_statement
date || credit || debit || balance
02/02/2022 || 50.25 || || 82.25
02/02/2022 || 32.00 || || 32.00
 => ["02/02/2022 || 50.25 || || 82.25", "02/02/2022 || 32.00 || || 32.00"]
 ```

I can also withdraw 

```
>account.withdraw(64)
=> ["02/02/2022 || 32.00 || || 32.00", "02/02/2022 || 50.25 || || 82.25", "02/02/2022 || || 64.00 || 18.25"]
> account.withdraw(12.25)
=> ["02/02/2022 || 32.00 || || 32.00", "02/02/2022 || 50.25 || || 82.25", "02/02/2022 || || 64.00 || 18.25", "02/02/2022 || || 12.25 || 6.00"]
```

The print statement should update with the most recent transaction at the top

```
> statement.print_statement
date || credit || debit || balance
02/02/2022 || || 12.25 || 6.00
02/02/2022 || || 64.00 || 18.25
02/02/2022 || 50.25 || || 82.25
02/02/2022 || 32.00 || || 32.00
 => ["02/02/2022 || || 12.25 || 6.00", "02/02/2022 || || 64.00 || 18.25", "02/02/2022 || 50.25 || || 82.25", "02/02/2022 || 32.00 || || 32.00"]
```