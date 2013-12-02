require 'cdflib'
local ffi = require 'ffi'
local myTests = {}
local tester = torch.Tester()

function myTests.testCdflibHuge()
    tester:asserteq(cdflib.ffi.cdft1_wrap(10, math.huge), 1, 'CDF(math.huge) != 1')
    tester:asserteq(cdflib.ffi.cdft1_wrap(10, 1e155), 1, 'CDF(1e155) != 1')
end


tester:add(myTests)
tester:run()
