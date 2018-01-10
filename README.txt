####### 1. Granting permissions

# as specified in the spec file, "All objects are created / managed by Caller", so if the Caller is going to assign a permission to few users at once he/she/it would create a permission, remember returned id of the permission and sequentially assign this id to a list of chosen users like here:

curl ... POST -d ' {"permission":{"name":"allow to reboot the machine"}}'  http://localhost:3000/api/v1/permissions
# let's say that this calling returned 5 denoting id of the permission

### direct assign
# assign this permission to first three users
curl ... PUT -d ' {"permission":{"id":5}}'  http://localhost:3000/api/v1/users/1/assign_permission
curl ... PUT -d ' {"permission":{"id":5}}'  http://localhost:3000/api/v1/users/2/assign_permission
curl ... PUT -d ' {"permission":{"id":5}}'  http://localhost:3000/api/v1/users/3/assign_permission

### indirect assign via roles
curl ... POST -d ' {"role":{"name":"admin"}}'  http://localhost:3000/api/v1/roles
# let's say that this calling returned 15 denoting id of the role
# so let's now assign our permission to this role  
curl ... PUT -d ' {"permission":{"id":5}}'  http://localhost:3000/api/v1/roles/15/assign_permission
# and assign the role to our users
curl ... PUT -d ' {"role":{"id":15}}'  http://localhost:3000/api/v1/users/1/assign_role
curl ... PUT -d ' {"role":{"id":15}}'  http://localhost:3000/api/v1/users/2/assign_role
curl ... PUT -d ' {"role":{"id":15}}'  http://localhost:3000/api/v1/users/3/assign_role



####### 2. Checking for a particular permission

curl ... GET  http://localhost:3000/api/v1/users/1/has_assigned_permission?permission_id=15



Sidenotes: As specified in the specs, module should not provide any dictionaries to Caller, so all the resources specified in routes file don't define :show or :index actions, also don't define :delete or :update actions as specs didn't touch these matters.
