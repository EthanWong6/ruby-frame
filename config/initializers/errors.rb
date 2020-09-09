#404错误
class Error_404 < StandardError;
end
class Not_Found_Error < Error_404
  NOT_FOUND_ERROR_MESSAGE = '不存在ppp'
end

# 401
class Error_401 < StandardError;
end
class Auth_Error < Error_401

end
