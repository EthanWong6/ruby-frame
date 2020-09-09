class Error_404 < StandardError; end
class Not_Found_Error < Error_404
  NOT_FOUND_ERROR_MESSAGE='不存在ppp'
end
