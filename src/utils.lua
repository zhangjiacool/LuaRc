local lpeg = require'lpeg'
local ml = require'ml'

tostring = ml.tstring

function token(id, patt) 
	return lpeg.Ct(lpeg.Cc(id) * lpeg.C(patt)) 
end

space = lpeg.S(' \t')^0
digit = lpeg.R'09'

-- range of valid characters after first character of identifier
idsafe = lpeg.R('AZ', 'az') + lpeg.P '_'

-- identifiers
ident = idsafe * (idsafe + digit) ^ 0

-- numbers
number_sign = lpeg.S'+-'^-1
number_decimal = digit ^ 1
number_hexadecimal = lpeg.P '0' * lpeg.S 'xX' * lpeg.R('09', 'AF', 'af') ^ 1
number_float = (digit^1 * lpeg.P'.' * digit^0 + lpeg.P'.' * digit^1) *
                     (lpeg.S'eE' * number_sign * digit^1)^-1

--cplusplus
define = lpeg.P('#define')