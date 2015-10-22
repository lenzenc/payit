# PayIt [![Build Status](https://travis-ci.org/lenzenc/payit.svg?branch=master)](https://travis-ci.org/lenzenc/payit) [![Coverage Status](https://coveralls.io/repos/lenzenc/payit/badge.svg?branch=master&service=github)](https://coveralls.io/github/lenzenc/payit?branch=master)
----
PayIt allows companies to route their employee spend items (Invoices, Purchase Request) through PayIt's powerful approval engine.

## Database
### Rake Commands
If you really need to completely re-init the database you can run the following command...

    rake payit:db:reset

### PSQL Commands

Connect to DB

    psql -d payit_dev

List All Tables

    payit_dev=# \dt

Exit PSQL

    \q

Describe Table Details

    \d+ <<table_name>>
