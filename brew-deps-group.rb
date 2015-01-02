require 'keg'
require 'formula'

module BrewDepsGroup

  USAGE = <<-EOS.undent
  DESCRIPTION

  USAGE
    brew deps-group
  EOS

  module_function

  def depsGroup
    system "python", "#{bin}/brew-deps-group.py"
  end
end

BrewDepsGroup.depsGroup
exit 0
