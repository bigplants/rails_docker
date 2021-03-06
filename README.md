# Rails Docker

# Requirements
- docker
- docker-compose

# Get started
1. docker-compose up --build
1. http://localhost:3000

## Brief Explanation
`docker-compose up` has the following task:
- `docker-compose exec web rails db:create`
- `docker-compose exec web rails db:migrate`

# IDEA setting
1. Import Project
1. File -> Project Structure
1. Module -> Ruby SDK and Gems
1. `+` and `New remote`
1. Choose `Docker Compose`
1. Platform Settings -> SDKs
1. `+` and `Ruby SDK` and `New remote` -> `Docker Compose`
1. Project Settings -> Project -> Project SDK -> Choose remote interpreter.
1. Run/Debug Configurations
1. `+` and `Rails`
1. Check `Run browser` and `Start Javascript ...`
1. In `Ruby SDK`, choose `Use other SDK` and docker-compose interpreter.

## DB client setting
- Host: `localhost`
- Database: `myapp_development`
- User: `root`
- Password: `root_password`
- Port: `6033`
