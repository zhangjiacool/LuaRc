lpeg = require'lpeg'
utils = require'utils'

idvalue = {}

print(lpeg.match(define, '#define'))

local function savedefine(define, ident, number)
	idvalue[ident] = number
end

define_id_value_line = lpeg.C(define)* space * lpeg.C(ident) * space * lpeg.C(number_decimal) * space * lpeg.P('\r\n')

function parser(strContent)
	lpeg.match(lpeg.Cf(define_id_value, savedefine), strContent)
end