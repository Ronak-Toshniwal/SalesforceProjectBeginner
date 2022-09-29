# SCENARIO of This Projects
## Create Registration object with below mentioned field:
- Previous class
- Requested class for admission
- Occupation of father(salaried,business,other)
- Occupation of mother(salaried,business,other)
- Family income(less than 3,3 to 5 lac,5 to 10 lac, above 10 lac)
- Father alive
- Mother alive
- Last class percentage
- Last class grade
- priority
- Contact lookupFirst name
- Last name
- Date of birth
- Address
- Mobile number
- Email address
- Status(New,Approved,Rejected)
- Create a lightning page to get registration details and store in the respective objects
- Create metadata as mentioned below:
## EligibilityScorePriority mapping:
- 0-60 => 5
- 61-75 => 4
- 76-85 => 3
- 85-90 => 2
- 90-100 => 1

## Write logic in trigger to set priority for registration
### Logic to calculate eligibility score:
### Eligibility score values:
- Family income less than 3 lac => 50
- Family income greater than 3 lac and less than 10 lac => 40
- Family income greater than 10 lac => 50
- Last class percentage > 90 => 30
- Last class percentage > 80 => 25
- Last class percentage > 70 => 20
- Last class percentage > 60 => 15
- Last class percentage < 60 => 5
- Both parents are alive => 5
- Only one is alive => 10
- Only one is alive and non working => 20

### Create a case object record when a new registration record is inserted and assign it to the
‘Admin’ queue.

### Case can be closed by any member of the ‘Admin’ queue, no one else can close the case.
Before closing the case, the related registration object ‘Status field should be set to ‘Approved’
or ‘Rejected’.

### Write trigger to check that a registration with highest priority should not be pending when
approving/rejecting the lower priority registration.
