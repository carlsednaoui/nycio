# NYC.IO


[![Coverage Status](https://coveralls.io/repos/carlsednaoui/nycio/badge.png)](https://coveralls.io/r/carlsednaoui/nycio) [![Build Status](https://travis-ci.org/carlsednaoui/nycio.svg?branch=master)](https://travis-ci.org/carlsednaoui/nycio)

Interested in helping out? We'd love your help building this platform!

[User stories](https://docs.google.com/a/thinkful.com/document/d/1S0ICy4SJa5wfy8_33E2P-pu_Es-jCySnCcmWwaYSqIs/edit) and [designs](https://docs.google.com/a/thinkful.com/file/d/0Bwa0eIBu4SzTSVRNY3hwMEgya00/edit).


Getting started:
- Clone the project
- Launch [postgres](http://postgresapp.com/)
- Run `rake db:create`
- Run `rails server`


## About NYC.IO
#### DB Structure
```
|—Organizations
|—Programs
|—Program_Iterations

|-Users
  |-Admin
  |-Organization
  |-Volunteer
    |-Can have many organizations
```

#### Who
1. Volunteers
2. Organizations
3. Parents & students
4. Donors (just keep them in mind)

#### Why
1. A volunteer simply wants to volunteer their time
2. An organization primarily wants volunteers — they also want attendees
3. Parents & students want to find programs
4. ?

#### Success
1. Success for a volunteer is to find an opportunity to help
2. Success for an organization is to be able to manage their organization/ programs, get volunteers
3. Success for a parent/ student is to be able to find a program

#### Flow
- Volunteers can opt to receive monthly digest
- Volunteers can sign up to be contacted by organizations
- Volunteers can sign up for a specific program (and can opt-in to be contacted by other orgs)
    - _Note_: How do we ensure volunteers don't get hammered by org requests?
