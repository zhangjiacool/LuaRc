lpeg = require'lpeg'
ml = require'ml'

tostring = ml.tstring

local function main()
	print(lpeg.Ct(lpeg.C(lpeg.P(1)^0)):match('abcd'))
end
main()
