module AuthHelper
  def verify_authorize
    error!('Unauthorized', 401) unless headers['Secret-Password'] == 'swordfish'
  end
end
