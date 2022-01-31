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

```
-[]
> As a Bank
> So that a client can deposit and withdraw thier own money   
> I would like each account to start with a balance of 0   

-[]
> As a Bank   
>So that clients can only withdraw money that they have deposited   
>I would like withdrawals to only happen if the client has sufficient funds   

-[]
> As a client
> So that I can have a place to store my money 
> I would like to create an account

-[]
> As a client
> So that I can save my money in my account
> I would like to to be able to deposit money into that account

-[]
> As a client
> So that I can spent my money 
> I would like to to be able to withdraw money


-[]
> As a client
> So that I can see a record of my transactions  
> I would like to to be to print and account statment
```

| CLASS           |
| Account         |
| ATTRIBUTES      |
| @balance = 0    |
| METHODS         |
| deposit         | 
| account_statment|