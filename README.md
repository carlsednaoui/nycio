# NYC.IO

Interested in helping out? We'd love your help building this platform!


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
