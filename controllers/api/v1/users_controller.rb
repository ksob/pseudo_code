class Api::V1::UsersController < Api::V1::BaseController
  #
  # GET
  #
  # Params: permission_id passed via GET 
  #
  # Infer if a user has assinged a permission 
  #
  def has_assigned_permission
  	# check made based on users_permissions and roles_permissions tables
  end

  #
  # PUT
  #
  # Params: id of a permission object passed via POST, JSON encoded
  #
  # Assign already existing permission to a user 
  #
  def assign_permission
  	# using users_permissions table for storage
  end
end
