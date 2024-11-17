# CSC 422 Term Project

## Setup
1. Clone repository to local host
2. If not installed, install Docker Desktop.
3. Start the Docker Daemon. Can be done by opening Docker.
4. In project root. Run `docker compose up --build`

## Running 
1. If no changes have been made to any files, and you want to start everything up. Run `docker compose up` (**Note, if you **)
2. When done, run `docker compose down`

Other notes: Periodically, run the following commands:

- `docker image prune -a`
- `docker volume prune -a`

to clear up disk space.

## Flyway and DB Migrations
We are using Flyway to migrate the database. Flyway is version control for the db. We areable to rebuild the db from scratch everytime we spin up a db container.

### Baseline Migrations
Naming convention: `V#__Description of what is being done.sql`

Example: `V1__CreateTable.sql`

Any seed scripts, creating tables, modifying schema, dropping tables should be in these type of files. 

The numbering needs to be unique and sequential. (i.e. V1, V2, V3 or V1.0 V1.1)

Link to documentation: [Baseline Migrations](https://documentation.red-gate.com/flyway/flyway-cli-and-api/tutorials/tutorial-baseline-migrations)

### Repeatable Migrations
Naming convention: `R__Description of what is being done.sql`

Example: `R__Add_Student_Stored_Procedure.sql`

Any triggers, stored procedures/functions, views, etc should be in these type of files.

Link to documentation: [Repeatable Migrations](https://documentation.red-gate.com/flyway/flyway-cli-and-api/tutorials/tutorial-repeatable-migrations)
