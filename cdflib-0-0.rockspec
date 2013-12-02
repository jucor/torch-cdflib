package = 'cdflib'
version = '0-0'

source = {
   url = 'git://github.com/jucor/torch-cdflib.git',
   branch = 'master'
}

description = {
  summary = "CDFLib library, wrapped for Torch",
  homepage = "http://jucor.github.io/torch-cdflib",
  detailed = "",
  license = "BSD",
  maintainer = "Julien Cornebise <julien@cornebise.com>"
}

dependencies = { 'torch >= 7.0', 'torchffi'}
build = {
   type = "command",
   build_command = [[
cmake -E make_directory build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)"; 
$(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install"
}
