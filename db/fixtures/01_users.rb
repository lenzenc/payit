Customer.seed(:id, {id: 1, name: 'PayIt Inc.', domain: 'payit.com'})
User.seed(:id,
  {
    id: 1,
    first_name: 'Craig',
    last_name: 'Lenzen',
    employee_id: 'clenzen',
    username: 'craig.lenzen@payit.com',
    email: 'craig.lenzen@payit.com',
    password: 'payit123',
    password_confirmation: 'payit123',
    customer_id: 1 },
  {
    id: 2,
    first_name: 'Dave',
    last_name: 'Lenzen',
    employee_id: 'dclenzen',
    username: 'david.lenzen@payit.com',
    email: 'david.lenzen@payit.com',
    password: 'payit123',
    password_confirmation: 'payit123',
    customer_id: 1 }
)
