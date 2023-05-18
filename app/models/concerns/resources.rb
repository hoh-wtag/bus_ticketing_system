module Resources
  VALID_PASSWORD_REGEX =
    /\A^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$&+,:;=?@#|'<>.-^*()%!])[A-Za-z\d$&+,:;=?@#|'<>.-^*()%!]{8,}$\z/
  VALID_NAME_REGEX = /\A[A-Za-z]+\z/
  VALID_LOCATION_REGEX = /\A[A-Za-z\s]+\z/
  VALID_BUSCODE_REGEX = /\A^[A-Za-z0-9]+[-#_][A-Za-z0-9]+$\z/
  VALID_SEATCODE_REGEX = /\A[A-Z]\d$\z/
end
