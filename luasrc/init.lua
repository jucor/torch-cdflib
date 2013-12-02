local ffi = require("ffi")
require 'torchffi'

cdflib = {}
cdflib.ffi = ffi.load(package.searchpath('libcdflib', package.cpath))

-- imports for cdflib
ffi.cdef[[
double cdfbet3_wrap(double p, double x, double b);
double cdfbet4_wrap(double p, double x, double a);

double cdfbin2_wrap(double p, double xn, double pr);
double cdfbin3_wrap(double p, double s, double pr);

double cdfchi3_wrap(double p, double x);

double cdfchn1_wrap(double x, double df, double nc);
double cdfchn2_wrap(double p, double df, double nc);
double cdfchn3_wrap(double p, double x, double nc);
double cdfchn4_wrap(double p, double x, double df);

double cdff3_wrap(double p, double f, double dfd);
double cdff4_wrap(double p, double f, double dfn);

double cdffnc1_wrap(double f, double dfn, double dfd, double nc);
double cdffnc2_wrap(double p, double dfn, double dfd, double nc);
double cdffnc3_wrap(double p, double f, double dfd, double nc);
double cdffnc4_wrap(double p, double f, double dfn, double nc);
double cdffnc5_wrap(double p, double f, double dfn, double dfd);

double cdfgam1_wrap(double p, double x, double scl);
double cdfgam2_wrap(double p, double x, double shp);
double cdfgam3_wrap(double p, double x, double scl);
double cdfgam4_wrap(double p, double x, double shp);

double cdfnbn2_wrap(double p, double xn, double pr);
double cdfnbn3_wrap(double p, double s, double pr);

double cdfnor3_wrap(double p, double x, double std);
double cdfnor4_wrap(double p, double x, double mn);

double cdfpoi2_wrap(double p, double xlam);

double cdft1_wrap(double p, double t);
double cdft2_wrap(double p, double t);
double cdft3_wrap(double p, double t);

double cdftnc1_wrap(double df, double nc, double t);
double cdftnc2_wrap(double df, double nc, double p);
double cdftnc3_wrap(double p, double nc, double t);
double cdftnc4_wrap(double df, double p, double t);

double tukeylambdacdf(double x, double lambda);
]]

-- Use metatable to pass all undefined indexing to cdflib.ffi
local mt = {}
setmetatable(cdflib, mt)
mt.__index = function(table, key)
    return rawget(cdflib, key) or cdflib.ffi[key]
end

return cdflib

